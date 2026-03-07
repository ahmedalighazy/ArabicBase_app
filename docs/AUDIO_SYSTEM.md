# نظام الصوتيات - Audio System Architecture

## نظرة عامة

نظام الصوتيات هو القلب النابض لتطبيق ArabicBase. يتيح للمستخدمين الاستماع إلى المقاطع الصوتية والكلمات الكاملة بطريقة سلسة وفعالة.

## المتطلبات الأساسية

### 1. الوظائف المطلوبة
- ✅ تشغيل صوت لكل مقطع صوتي
- ✅ تشغيل صوت للكلمة كاملة
- ✅ إيقاف الصوت السابق عند تشغيل صوت جديد
- ✅ التحميل المسبق للملفات الصوتية
- ✅ التخزين المؤقت (Caching)
- ✅ العمل بدون اتصال بالإنترنت
- ✅ معالجة الأخطاء

### 2. تجربة المستخدم المطلوبة
- لا تأخير عند تشغيل الصوت
- مؤشرات بصرية واضحة
- استجابة فورية للنقرات
- معالجة سلسة للأخطاء

## معمارية النظام

### الهيكل الكامل

```
features/audio_player/
├── data/
│   ├── datasources/
│   │   ├── audio_cache_datasource.dart
│   │   └── audio_remote_datasource.dart
│   ├── models/
│   │   └── audio_file_model.dart
│   └── repositories/
│       └── audio_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── audio_file.dart
│   ├── repositories/
│   │   └── audio_repository.dart
│   └── usecases/
│       ├── play_audio.dart
│       ├── stop_audio.dart
│       ├── preload_audio.dart
│       └── pause_audio.dart
└── presentation/
    ├── cubit/
    │   ├── audio_player_cubit.dart
    │   └── audio_player_state.dart
    └── widgets/
        ├── audio_button.dart
        └── audio_visualizer.dart
```

## الطبقات التفصيلية

### 1. Domain Layer (طبقة المنطق)

#### Entity: AudioFile
```dart
class AudioFile {
  final String id;
  final String url;
  final Duration? duration;
  final AudioType type;
  
  AudioFile({
    required this.id,
    required this.url,
    this.duration,
    required this.type,
  });
}

enum AudioType {
  segment,    // صوت مقطع
  fullWord,   // صوت كلمة كاملة
  letter,     // صوت حرف
}
```

#### Repository Interface
```dart
abstract class AudioRepository {
  Future<Either<Failure, void>> play(AudioFile audio);
  Future<Either<Failure, void>> stop();
  Future<Either<Failure, void>> pause();
  Future<Either<Failure, void>> resume();
  Future<Either<Failure, void>> preload(List<AudioFile> audios);
  Stream<AudioPlayerState> get stateStream;
}
```

#### UseCases

**PlayAudio**
```dart
class PlayAudio implements UseCase<void, AudioFile> {
  final AudioRepository repository;
  
  PlayAudio(this.repository);
  
  @override
  Future<Either<Failure, void>> call(AudioFile audio) async {
    return await repository.play(audio);
  }
}
```

**StopAudio**
```dart
class StopAudio implements UseCase<void, NoParams> {
  final AudioRepository repository;
  
  StopAudio(this.repository);
  
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.stop();
  }
}
```

**PreloadAudio**
```dart
class PreloadAudio implements UseCase<void, List<AudioFile>> {
  final AudioRepository repository;
  
  PreloadAudio(this.repository);
  
  @override
  Future<Either<Failure, void>> call(List<AudioFile> audios) async {
    return await repository.preload(audios);
  }
}
```

---

### 2. Data Layer (طبقة البيانات)

#### Model: AudioFileModel
```dart
class AudioFileModel extends AudioFile {
  AudioFileModel({
    required String id,
    required String url,
    Duration? duration,
    required AudioType type,
  }) : super(
    id: id,
    url: url,
    duration: duration,
    type: type,
  );
  
  factory AudioFileModel.fromJson(Map<String, dynamic> json) {
    return AudioFileModel(
      id: json['id'],
      url: json['url'],
      duration: json['duration'] != null 
        ? Duration(milliseconds: json['duration']) 
        : null,
      type: AudioType.values.byName(json['type']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'duration': duration?.inMilliseconds,
      'type': type.name,
    };
  }
}
```

#### DataSource: AudioCacheDataSource
```dart
abstract class AudioCacheDataSource {
  Future<String?> getCachedAudioPath(String audioId);
  Future<void> cacheAudio(String audioId, String audioPath);
  Future<bool> isAudioCached(String audioId);
  Future<void> clearCache();
  Future<int> getCacheSize();
}

class AudioCacheDataSourceImpl implements AudioCacheDataSource {
  final Directory cacheDirectory;
  
  AudioCacheDataSourceImpl(this.cacheDirectory);
  
  @override
  Future<String?> getCachedAudioPath(String audioId) async {
    final file = File('${cacheDirectory.path}/$audioId.mp3');
    if (await file.exists()) {
      return file.path;
    }
    return null;
  }
  
  @override
  Future<void> cacheAudio(String audioId, String audioPath) async {
    final file = File('${cacheDirectory.path}/$audioId.mp3');
    await File(audioPath).copy(file.path);
  }
  
  @override
  Future<bool> isAudioCached(String audioId) async {
    final file = File('${cacheDirectory.path}/$audioId.mp3');
    return await file.exists();
  }
  
  @override
  Future<void> clearCache() async {
    if (await cacheDirectory.exists()) {
      await cacheDirectory.delete(recursive: true);
      await cacheDirectory.create();
    }
  }
  
  @override
  Future<int> getCacheSize() async {
    int totalSize = 0;
    if (await cacheDirectory.exists()) {
      await for (var entity in cacheDirectory.list(recursive: true)) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }
    }
    return totalSize;
  }
}
```

#### DataSource: AudioRemoteDataSource
```dart
abstract class AudioRemoteDataSource {
  Future<String> downloadAudio(String url);
}

class AudioRemoteDataSourceImpl implements AudioRemoteDataSource {
  final Dio dio;
  
  AudioRemoteDataSourceImpl(this.dio);
  
  @override
  Future<String> downloadAudio(String url) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileName = url.split('/').last;
      final filePath = '${tempDir.path}/$fileName';
      
      await dio.download(url, filePath);
      return filePath;
    } catch (e) {
      throw ServerException();
    }
  }
}
```

#### Repository Implementation
```dart
class AudioRepositoryImpl implements AudioRepository {
  final AudioPlayer audioPlayer;
  final AudioCacheDataSource cacheDataSource;
  final AudioRemoteDataSource remoteDataSource;
  
  final _stateController = StreamController<AudioPlayerState>.broadcast();
  String? _currentAudioId;
  
  AudioRepositoryImpl({
    required this.audioPlayer,
    required this.cacheDataSource,
    required this.remoteDataSource,
  });
  
  @override
  Stream<AudioPlayerState> get stateStream => _stateController.stream;
  
  @override
  Future<Either<Failure, void>> play(AudioFile audio) async {
    try {
      // إيقاف الصوت الحالي إذا كان يعمل
      if (_currentAudioId != null) {
        await audioPlayer.stop();
      }
      
      _stateController.add(AudioLoading());
      
      // البحث عن الملف في الكاش
      String? audioPath = await cacheDataSource.getCachedAudioPath(audio.id);
      
      // إذا لم يكن موجوداً، تحميله
      if (audioPath == null) {
        if (audio.url.startsWith('http')) {
          audioPath = await remoteDataSource.downloadAudio(audio.url);
          await cacheDataSource.cacheAudio(audio.id, audioPath);
        } else {
          // ملف محلي (assets)
          audioPath = audio.url;
        }
      }
      
      // تشغيل الصوت
      await audioPlayer.setFilePath(audioPath);
      await audioPlayer.play();
      
      _currentAudioId = audio.id;
      _stateController.add(AudioPlaying(audioId: audio.id));
      
      // الاستماع لانتهاء التشغيل
      audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          _stateController.add(AudioStopped());
          _currentAudioId = null;
        }
      });
      
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    } catch (e) {
      return Left(AudioFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> stop() async {
    try {
      await audioPlayer.stop();
      _stateController.add(AudioStopped());
      _currentAudioId = null;
      return Right(null);
    } catch (e) {
      return Left(AudioFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> pause() async {
    try {
      await audioPlayer.pause();
      _stateController.add(AudioPaused());
      return Right(null);
    } catch (e) {
      return Left(AudioFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> resume() async {
    try {
      await audioPlayer.play();
      _stateController.add(AudioPlaying(audioId: _currentAudioId!));
      return Right(null);
    } catch (e) {
      return Left(AudioFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> preload(List<AudioFile> audios) async {
    try {
      for (var audio in audios) {
        final isCached = await cacheDataSource.isAudioCached(audio.id);
        if (!isCached && audio.url.startsWith('http')) {
          final audioPath = await remoteDataSource.downloadAudio(audio.url);
          await cacheDataSource.cacheAudio(audio.id, audioPath);
        }
      }
      return Right(null);
    } catch (e) {
      return Left(AudioFailure());
    }
  }
  
  void dispose() {
    _stateController.close();
    audioPlayer.dispose();
  }
}
```

---

### 3. Presentation Layer (طبقة العرض)

#### States
```dart
sealed class AudioPlayerState {}

class AudioInitial extends AudioPlayerState {}

class AudioLoading extends AudioPlayerState {}

class AudioPlaying extends AudioPlayerState {
  final String audioId;
  final Duration position;
  final Duration duration;
  
  AudioPlaying({
    required this.audioId,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });
}

class AudioPaused extends AudioPlayerState {
  final String audioId;
  final Duration position;
  
  AudioPaused({
    required this.audioId,
    required this.position,
  });
}

class AudioStopped extends AudioPlayerState {}

class AudioError extends AudioPlayerState {
  final String message;
  
  AudioError(this.message);
}
```

#### Cubit
```dart
class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final PlayAudio playAudio;
  final StopAudio stopAudio;
  final PauseAudio pauseAudio;
  final PreloadAudio preloadAudio;
  
  StreamSubscription? _stateSubscription;
  
  AudioPlayerCubit({
    required this.playAudio,
    required this.stopAudio,
    required this.pauseAudio,
    required this.preloadAudio,
  }) : super(AudioInitial());
  
  Future<void> play(AudioFile audio) async {
    emit(AudioLoading());
    
    final result = await playAudio(audio);
    
    result.fold(
      (failure) => emit(AudioError(_mapFailureToMessage(failure))),
      (_) {}, // الحالة ستأتي من الـ stream
    );
  }
  
  Future<void> stop() async {
    final result = await stopAudio(NoParams());
    
    result.fold(
      (failure) => emit(AudioError(_mapFailureToMessage(failure))),
      (_) => emit(AudioStopped()),
    );
  }
  
  Future<void> pause() async {
    final result = await pauseAudio(NoParams());
    
    result.fold(
      (failure) => emit(AudioError(_mapFailureToMessage(failure))),
      (_) {}, // الحالة ستأتي من الـ stream
    );
  }
  
  Future<void> preloadAudios(List<AudioFile> audios) async {
    await preloadAudio(audios);
  }
  
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'فشل تحميل الملف الصوتي';
      case CacheFailure:
        return 'فشل حفظ الملف الصوتي';
      case AudioFailure:
        return 'خطأ في تشغيل الصوت';
      default:
        return 'خطأ غير متوقع';
    }
  }
  
  @override
  Future<void> close() {
    _stateSubscription?.cancel();
    return super.close();
  }
}
```

#### Widget: AudioButton
```dart
class AudioButton extends StatelessWidget {
  final AudioFile audio;
  final double size;
  final Color? color;
  
  const AudioButton({
    Key? key,
    required this.audio,
    this.size = 48.0,
    this.color,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        final isPlaying = state is AudioPlaying && state.audioId == audio.id;
        final isLoading = state is AudioLoading;
        
        return GestureDetector(
          onTap: () {
            if (isPlaying) {
              context.read<AudioPlayerCubit>().stop();
            } else {
              context.read<AudioPlayerCubit>().play(audio);
            }
          },
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Icon(
                    isPlaying ? Icons.stop : Icons.volume_up,
                    color: Colors.white,
                    size: size * 0.5,
                  ),
          ),
        );
      },
    );
  }
}
```

---

## استراتيجيات التحسين

### 1. التحميل المسبق (Preloading)

**متى يتم التحميل المسبق؟**
- عند دخول شاشة الدرس
- في الخلفية للدرس التالي
- للأصوات المستخدمة بكثرة (الحروف)

**مثال:**
```dart
class WordLearningPage extends StatefulWidget {
  final Lesson lesson;
  
  @override
  _WordLearningPageState createState() => _WordLearningPageState();
}

class _WordLearningPageState extends State<WordLearningPage> {
  @override
  void initState() {
    super.initState();
    _preloadAudios();
  }
  
  Future<void> _preloadAudios() async {
    final words = widget.lesson.words;
    final audios = <AudioFile>[];
    
    for (var word in words) {
      // إضافة صوت الكلمة الكاملة
      audios.add(AudioFile(
        id: 'word_${word.id}_full',
        url: word.fullAudioUrl,
        type: AudioType.fullWord,
      ));
      
      // إضافة أصوات المقاطع
      for (var segment in word.segments) {
        audios.add(AudioFile(
          id: 'segment_${segment.id}',
          url: segment.audioUrl,
          type: AudioType.segment,
        ));
      }
    }
    
    // التحميل المسبق
    context.read<AudioPlayerCubit>().preloadAudios(audios);
  }
  
  @override
  Widget build(BuildContext context) {
    // ...
  }
}
```

### 2. إدارة الكاش

**استراتيجية الكاش:**
- حجم الكاش الأقصى: 100 MB
- الأولوية للملفات الأكثر استخداماً
- حذف الملفات القديمة عند امتلاء الكاش

**مثال:**
```dart
class CacheManager {
  final AudioCacheDataSource cacheDataSource;
  static const MAX_CACHE_SIZE = 100 * 1024 * 1024; // 100 MB
  
  CacheManager(this.cacheDataSource);
  
  Future<void> manageCacheSize() async {
    final currentSize = await cacheDataSource.getCacheSize();
    
    if (currentSize > MAX_CACHE_SIZE) {
      // حذف الملفات القديمة
      await cacheDataSource.clearCache();
    }
  }
}
```

### 3. معالجة الانقطاعات

**سيناريوهات الانقطاع:**
- مكالمة هاتفية
- إشعار
- تطبيق آخر يشغل صوت

**الحل:**
```dart
class AudioFocusManager {
  final AudioPlayer audioPlayer;
  
  AudioFocusManager(this.audioPlayer) {
    _setupAudioFocus();
  }
  
  void _setupAudioFocus() {
    audioPlayer.setAudioContext(
      AudioContext(
        android: AndroidAudioContext(
          isSpeechContent: true,
          stayAwake: false,
          contentType: AndroidAudioContentType.speech,
          usageType: AndroidAudioUsageType.media,
          audioFocus: AndroidAudioFocus.gain,
        ),
        iOS: IOSAudioContext(
          category: AVAudioSessionCategory.playback,
          options: [
            AVAudioSessionOptions.mixWithOthers,
          ],
        ),
      ),
    );
  }
}
```

---

## تنظيم ملفات الصوت

### هيكل المجلدات
```
assets/audio/
├── letters/              # أصوات الحروف (28 ملف)
│   ├── alef.mp3
│   ├── baa.mp3
│   ├── taa.mp3
│   └── ...
│
├── segments/             # أصوات المقاطع
│   ├── lesson_1/
│   │   ├── word_1_seg_1.mp3
│   │   ├── word_1_seg_2.mp3
│   │   └── ...
│   ├── lesson_2/
│   │   └── ...
│   └── ...
│
└── words/               # أصوات الكلمات الكاملة
    ├── lesson_1/
    │   ├── word_1_full.mp3
    │   ├── word_2_full.mp3
    │   └── ...
    ├── lesson_2/
    │   └── ...
    └── ...
```

### اصطلاحات التسمية
```
letters:    {letter_name}.mp3
segments:   lesson_{lesson_id}/word_{word_id}_seg_{segment_order}.mp3
words:      lesson_{lesson_id}/word_{word_id}_full.mp3
```

### مثال
```
الكلمة: "كتب" (word_id: 123, lesson_id: 5)

الملفات:
- assets/audio/segments/lesson_5/word_123_seg_1.mp3  (كـ)
- assets/audio/segments/lesson_5/word_123_seg_2.mp3  (تـ)
- assets/audio/segments/lesson_5/word_123_seg_3.mp3  (ب)
- assets/audio/words/lesson_5/word_123_full.mp3      (كتب)
```

---

## الحزم المطلوبة (Packages)

```yaml
dependencies:
  # Audio Player
  just_audio: ^0.9.36
  # أو
  audioplayers: ^5.2.1
  
  # File Management
  path_provider: ^2.1.1
  
  # Network
  dio: ^5.4.0
  
  # State Management
  flutter_bloc: ^8.1.3
  
  # Functional Programming
  dartz: ^0.10.1
  
  # Dependency Injection
  get_it: ^7.6.4
```

---

## أفضل الممارسات

### 1. الأداء
- ✅ استخدام التحميل المسبق
- ✅ ضغط ملفات الصوت (MP3, 64-128 kbps)
- ✅ تخزين مؤقت ذكي
- ✅ Lazy loading للملفات الكبيرة

### 2. تجربة المستخدم
- ✅ مؤشرات بصرية واضحة
- ✅ استجابة فورية
- ✅ رسائل خطأ واضحة
- ✅ إمكانية إعادة المحاولة

### 3. معالجة الأخطاء
- ✅ التعامل مع فقدان الاتصال
- ✅ التعامل مع ملفات تالفة
- ✅ التعامل مع نفاد المساحة
- ✅ Fallback للملفات المحلية

### 4. الاختبار
- ✅ اختبار التشغيل العادي
- ✅ اختبار بدون اتصال
- ✅ اختبار الانقطاعات
- ✅ اختبار الكاش

---

## الخلاصة

نظام الصوتيات المصمم يوفر:
- 🎵 تشغيل سلس وسريع
- 💾 إدارة ذكية للكاش
- 📶 عمل بدون اتصال
- 🔄 معالجة قوية للأخطاء
- 🚀 أداء عالي
- 👌 تجربة مستخدم ممتازة
