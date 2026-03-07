# أفضل الممارسات - Best Practices

## نظرة عامة

هذا الدليل يحتوي على أفضل الممارسات لتطوير تطبيق ArabicBase باستخدام Flutter و Clean Architecture.

---

## 1. Clean Architecture

### قاعدة التبعية (Dependency Rule)

**القاعدة الذهبية:** الطبقات الداخلية لا تعتمد على الطبقات الخارجية

```
Presentation → Domain ← Data
     ↓           ↑         ↑
   Widgets    Entities   Models
```

**✅ صحيح:**
```dart
// domain/entities/word.dart
class Word {
  final String id;
  final String text;
  // لا يوجد import من Flutter أو أي مكتبة خارجية
}
```

**❌ خطأ:**
```dart
// domain/entities/word.dart
import 'package:flutter/material.dart'; // ❌ خطأ!

class Word {
  final String id;
  final Color color; // ❌ Color من Flutter
}
```

### فصل المسؤوليات

**كل طبقة لها مسؤولية واحدة:**

```dart
// ✅ Presentation: عرض البيانات فقط
class WordLearningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordLearningCubit, WordLearningState>(
      builder: (context, state) {
        // عرض UI فقط
      },
    );
  }
}

// ✅ Domain: منطق الأعمال فقط
class GetWordsByLesson implements UseCase<List<Word>, String> {
  final WordRepository repository;
  
  @override
  Future<Either<Failure, List<Word>>> call(String lessonId) {
    return repository.getWordsByLesson(lessonId);
  }
}

// ✅ Data: جلب البيانات فقط
class WordRepositoryImpl implements WordRepository {
  final WordLocalDataSource localDataSource;
  final WordRemoteDataSource remoteDataSource;
  
  @override
  Future<Either<Failure, List<Word>>> getWordsByLesson(String lessonId) {
    // جلب البيانات من المصادر
  }
}
```

---

## 2. State Management (إدارة الحالة)

### استخدام Cubit للمنطق البسيط

```dart
// ✅ مثال جيد: Cubit بسيط
class SplashCubit extends Cubit<SplashState> {
  final CheckFirstLaunch checkFirstLaunch;
  
  SplashCubit(this.checkFirstLaunch) : super(SplashInitial());
  
  Future<void> checkAppStatus() async {
    emit(SplashLoading());
    
    final result = await checkFirstLaunch(NoParams());
    
    result.fold(
      (failure) => emit(SplashError()),
      (isFirstLaunch) => emit(
        isFirstLaunch ? SplashNavigateToOnboarding() : SplashNavigateToHome()
      ),
    );
  }
}
```

### استخدام Bloc للمنطق المعقد

```dart
// ✅ مثال جيد: Bloc للأحداث المعقدة
class WordLearningBloc extends Bloc<WordLearningEvent, WordLearningState> {
  final GetWordsByLesson getWordsByLesson;
  final PlayAudio playAudio;
  
  WordLearningBloc({
    required this.getWordsByLesson,
    required this.playAudio,
  }) : super(WordLearningInitial()) {
    on<LoadWords>(_onLoadWords);
    on<PlaySegmentAudio>(_onPlaySegmentAudio);
    on<PlayFullWordAudio>(_onPlayFullWordAudio);
  }
  
  Future<void> _onLoadWords(
    LoadWords event,
    Emitter<WordLearningState> emit,
  ) async {
    // معالجة الحدث
  }
}
```

### States غير قابلة للتغيير (Immutable)

```dart
// ✅ صحيح: State immutable
abstract class WordLearningState extends Equatable {
  const WordLearningState();
  
  @override
  List<Object?> get props => [];
}

class WordLearningLoaded extends WordLearningState {
  final List<Word> words;
  final int currentIndex;
  
  const WordLearningLoaded({
    required this.words,
    required this.currentIndex,
  });
  
  @override
  List<Object?> get props => [words, currentIndex];
  
  // ✅ copyWith للتحديث
  WordLearningLoaded copyWith({
    List<Word>? words,
    int? currentIndex,
  }) {
    return WordLearningLoaded(
      words: words ?? this.words,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

// ❌ خطأ: State mutable
class WordLearningLoaded extends WordLearningState {
  List<Word> words; // ❌ ليس final
  int currentIndex; // ❌ ليس final
  
  WordLearningLoaded({
    required this.words,
    required this.currentIndex,
  });
}
```

---

## 3. تنظيم الكود

### كلاس واحد لكل ملف

```dart
// ✅ صحيح: ملف واحد لكل كلاس
// word.dart
class Word {
  // ...
}

// phonetic_segment.dart
class PhoneticSegment {
  // ...
}

// ❌ خطأ: عدة كلاسات في ملف واحد
// entities.dart
class Word { }
class PhoneticSegment { }
class Lesson { }
```

### تنظيم الـ Imports

```dart
// ✅ الترتيب الصحيح
// 1. Dart imports
import 'dart:async';
import 'dart:io';

// 2. Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. Package imports
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// 4. Project imports
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/features/word_learning/domain/entities/word.dart';
```

### التعليقات الواضحة

```dart
// ✅ تعليقات مفيدة
/// يقوم بتشغيل الملف الصوتي للمقطع المحدد
/// 
/// يتحقق أولاً من وجود الملف في الكاش
/// إذا لم يكن موجوداً، يقوم بتحميله من السيرفر
/// 
/// [segment] المقطع الصوتي المراد تشغيله
/// Returns [Future<void>] عند اكتمال التشغيل
Future<void> playSegmentAudio(PhoneticSegment segment) async {
  // التحقق من الكاش
  final cachedPath = await _getCachedAudio(segment.id);
  
  if (cachedPath != null) {
    await _playAudio(cachedPath);
  } else {
    // تحميل من السيرفر
    final downloadedPath = await _downloadAudio(segment.audioUrl);
    await _cacheAudio(segment.id, downloadedPath);
    await _playAudio(downloadedPath);
  }
}

// ❌ تعليقات غير مفيدة
// يشغل الصوت
void playAudio() {
  // تشغيل
  player.play();
}
```

---

## 4. معالجة الأخطاء

### استخدام Either من Dartz

```dart
// ✅ صحيح: Either للنتائج
Future<Either<Failure, List<Word>>> getWords() async {
  try {
    final words = await dataSource.getWords();
    return Right(words);
  } on ServerException {
    return Left(ServerFailure());
  } on CacheException {
    return Left(CacheFailure());
  } catch (e) {
    return Left(UnexpectedFailure());
  }
}

// ❌ خطأ: throw exceptions في Repository
Future<List<Word>> getWords() async {
  final words = await dataSource.getWords(); // قد يرمي exception
  return words; // ❌
}
```

### Failures مخصصة

```dart
// ✅ تعريف Failures واضحة
abstract class Failure extends Equatable {
  final String message;
  
  const Failure(this.message);
  
  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure() : super('فشل الاتصال بالسيرفر');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('فشل الوصول للبيانات المحلية');
}

class AudioFailure extends Failure {
  const AudioFailure() : super('فشل تشغيل الملف الصوتي');
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('لا يوجد اتصال بالإنترنت');
}
```

### معالجة الأخطاء في UI

```dart
// ✅ عرض رسائل خطأ واضحة
BlocBuilder<WordLearningCubit, WordLearningState>(
  builder: (context, state) {
    if (state is WordLearningError) {
      return ErrorWidget(
        message: state.message,
        onRetry: () => context.read<WordLearningCubit>().loadWords(),
      );
    }
    // ...
  },
)

// ❌ تجاهل الأخطاء
BlocBuilder<WordLearningCubit, WordLearningState>(
  builder: (context, state) {
    if (state is WordLearningLoaded) {
      return WordsList(words: state.words);
    }
    return SizedBox(); // ❌ ماذا عن الأخطاء؟
  },
)
```

---

## 5. الأداء (Performance)

### استخدام const constructors

```dart
// ✅ استخدام const
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Text('مرحباً'); // ✅ const
  }
}

// ❌ بدون const
class MyWidget extends StatelessWidget {
  MyWidget({Key? key}) : super(key: key); // ❌
  
  @override
  Widget build(BuildContext context) {
    return Text('مرحباً'); // ❌
  }
}
```

### Lazy Loading

```dart
// ✅ تحميل البيانات عند الحاجة
class LessonsPage extends StatefulWidget {
  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  void initState() {
    super.initState();
    // تحميل البيانات فقط عند فتح الصفحة
    context.read<LessonsCubit>().loadLessons();
  }
  
  @override
  Widget build(BuildContext context) {
    // ...
  }
}

// ❌ تحميل كل البيانات في البداية
void main() {
  // تحميل كل الدروس عند بدء التطبيق ❌
  loadAllLessons();
  loadAllWords();
  loadAllAudios();
  
  runApp(MyApp());
}
```

### Pagination للقوائم الكبيرة

```dart
// ✅ تحميل تدريجي
class LessonsList extends StatefulWidget {
  @override
  _LessonsListState createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  final _scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  
  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent * 0.9) {
      // تحميل المزيد عند الوصول لـ 90% من القائمة
      context.read<LessonsCubit>().loadMoreLessons();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        // ...
      },
    );
  }
}
```

### Debounce للتفاعلات

```dart
// ✅ استخدام debounce للبحث
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Timer? _debounce;
  
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // البحث بعد 500ms من آخر كتابة
      context.read<SearchCubit>().search(query);
    });
  }
  
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onSearchChanged,
    );
  }
}
```

---

## 6. الاختبار (Testing)

### Unit Tests للـ Domain Layer

```dart
// ✅ اختبار UseCase
void main() {
  late GetWordsByLesson useCase;
  late MockWordRepository mockRepository;
  
  setUp(() {
    mockRepository = MockWordRepository();
    useCase = GetWordsByLesson(mockRepository);
  });
  
  test('should get words from repository', () async {
    // Arrange
    final tWords = [
      Word(id: '1', text: 'كتب'),
      Word(id: '2', text: 'قلم'),
    ];
    when(() => mockRepository.getWordsByLesson('1'))
        .thenAnswer((_) async => Right(tWords));
    
    // Act
    final result = await useCase('1');
    
    // Assert
    expect(result, Right(tWords));
    verify(() => mockRepository.getWordsByLesson('1'));
    verifyNoMoreInteractions(mockRepository);
  });
}
```

### Widget Tests

```dart
// ✅ اختبار Widget
void main() {
  testWidgets('should display word text', (tester) async {
    // Arrange
    const word = Word(id: '1', text: 'كتب');
    
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: WordDisplayWidget(word: word),
      ),
    );
    
    // Assert
    expect(find.text('كتب'), findsOneWidget);
  });
}
```

### Integration Tests

```dart
// ✅ اختبار تكامل
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('complete word learning flow', (tester) async {
    // بدء التطبيق
    app.main();
    await tester.pumpAndSettle();
    
    // تخطي onboarding
    await tester.tap(find.text('تخطي'));
    await tester.pumpAndSettle();
    
    // اختيار درس
    await tester.tap(find.text('الحروف العربية'));
    await tester.pumpAndSettle();
    
    // تشغيل صوت
    await tester.tap(find.byIcon(Icons.volume_up));
    await tester.pump(Duration(seconds: 2));
    
    // التحقق من التشغيل
    expect(find.byIcon(Icons.stop), findsOneWidget);
  });
}
```

---

## 7. الأمان (Security)

### عدم تخزين بيانات حساسة في الكود

```dart
// ❌ خطأ: API key في الكود
class ApiClient {
  static const API_KEY = 'sk_live_123456789'; // ❌
}

// ✅ صحيح: استخدام environment variables
class ApiClient {
  static const API_KEY = String.fromEnvironment('API_KEY');
}
```

### التحقق من المدخلات

```dart
// ✅ التحقق من المدخلات
class Validators {
  static String? validateLessonId(String? value) {
    if (value == null || value.isEmpty) {
      return 'معرف الدرس مطلوب';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'معرف الدرس يجب أن يكون رقماً';
    }
    return null;
  }
}
```

---

## 8. الترجمة (Localization)

### استخدام intl package

```dart
// ✅ ملفات الترجمة
// lib/l10n/app_ar.arb
{
  "appTitle": "قاعدة العربية",
  "welcome": "مرحباً",
  "lessons": "الدروس",
  "practice": "الممارسة"
}

// lib/l10n/app_en.arb
{
  "appTitle": "Arabic Base",
  "welcome": "Welcome",
  "lessons": "Lessons",
  "practice": "Practice"
}

// الاستخدام
Text(AppLocalizations.of(context)!.welcome)
```

### دعم RTL

```dart
// ✅ دعم RTL للعربية
MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: Locale('ar'), // العربية
  builder: (context, child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child!,
    );
  },
)
```

---

## 9. Git Best Practices

### Commit Messages

```bash
# ✅ رسائل واضحة
git commit -m "feat: add word learning screen"
git commit -m "fix: audio not playing on iOS"
git commit -m "refactor: improve audio player performance"
git commit -m "docs: update architecture documentation"

# ❌ رسائل غير واضحة
git commit -m "update"
git commit -m "fix bug"
git commit -m "changes"
```

### Branch Naming

```bash
# ✅ أسماء واضحة
feature/word-learning-screen
fix/audio-playback-ios
refactor/audio-player
docs/architecture

# ❌ أسماء غير واضحة
new-feature
fix
update
```

---

## 10. Documentation

### توثيق الكود

```dart
// ✅ توثيق واضح
/// Repository لإدارة الكلمات والمقاطع الصوتية
/// 
/// يوفر طرق للحصول على الكلمات من مصادر مختلفة
/// ويدير التخزين المؤقت للبيانات
abstract class WordRepository {
  /// يحصل على قائمة الكلمات لدرس معين
  /// 
  /// [lessonId] معرف الدرس
  /// Returns [Either<Failure, List<Word>>] قائمة الكلمات أو خطأ
  Future<Either<Failure, List<Word>>> getWordsByLesson(String lessonId);
  
  /// يحصل على تفاصيل كلمة معينة مع المقاطع الصوتية
  /// 
  /// [wordId] معرف الكلمة
  /// Returns [Either<Failure, Word>] الكلمة مع المقاطع أو خطأ
  Future<Either<Failure, Word>> getWordDetails(String wordId);
}
```

### README Files

```markdown
# Feature Name

## الغرض
وصف مختصر للميزة

## الملفات الرئيسية
- `file1.dart` - الوصف
- `file2.dart` - الوصف

## الاستخدام
مثال على الاستخدام

## الاختبارات
كيفية تشغيل الاختبارات
```

---

## الخلاصة

اتباع هذه الممارسات يضمن:
- ✅ كود نظيف وقابل للصيانة
- ✅ أداء عالي
- ✅ سهولة الاختبار
- ✅ قابلية التوسع
- ✅ تجربة مطور ممتازة
- ✅ تجربة مستخدم رائعة
