# دليل إضافة الأصول - Assets Integration Guide

## نظرة عامة

هذا الدليل يشرح كيفية استخدام الأصول (Assets) في الكود بعد إضافتها.

---

## 1. تحديث pubspec.yaml

أولاً، يجب تسجيل جميع الأصول في ملف `pubspec.yaml`:

```yaml
name: arabic_base
description: Arabic learning app for beginners and children
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  
  # Dependency Injection
  get_it: ^7.6.4
  
  # Network
  dio: ^5.4.0
  
  # Local Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.2
  
  # Audio
  just_audio: ^0.9.36
  
  # Routing
  go_router: ^13.0.0
  
  # Functional Programming
  dartz: ^0.10.1
  
  # Utils
  path_provider: ^2.1.1
  
  # Animations
  lottie: ^3.0.0
  
  # SVG Support
  flutter_svg: ^2.0.9

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  build_runner: ^2.4.7
  hive_generator: ^2.0.1

flutter:
  uses-material-design: true
  
  # Assets
  assets:
    # Images
    - assets/images/splash/
    - assets/images/onboarding/
    - assets/images/categories/
    - assets/images/icons/
    
    # Audio Files
    - assets/audio/letters/
    - assets/audio/segments/lesson_1/
    - assets/audio/segments/lesson_2/
    - assets/audio/segments/lesson_3/
    - assets/audio/words/lesson_1/
    - assets/audio/words/lesson_2/
    - assets/audio/words/lesson_3/
    
    # Animations
    - assets/animations/
  
  # Fonts
  fonts:
    - family: Cairo
      fonts:
        - asset: assets/fonts/Cairo-Light.ttf
          weight: 300
        - asset: assets/fonts/Cairo-Regular.ttf
          weight: 400
        - asset: assets/fonts/Cairo-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Cairo-Bold.ttf
          weight: 700
```

---

## 2. إنشاء ملف Constants للأصول

### core/constants/assets_constants.dart

```dart
/// ثوابت مسارات الأصول
class AssetsConstants {
  AssetsConstants._();
  
  // ==================== Images ====================
  
  // Splash
  static const String splashLogo = 'assets/images/splash/logo.png';
  static const String splashBackground = 'assets/images/splash/background.png';
  
  // Onboarding
  static const String onboarding1 = 'assets/images/onboarding/onboarding_1.png';
  static const String onboarding2 = 'assets/images/onboarding/onboarding_2.png';
  static const String onboarding3 = 'assets/images/onboarding/onboarding_3.png';
  
  // Categories
  static const String categoryLetters = 'assets/images/categories/letters.png';
  static const String categoryTwoLetterWords = 'assets/images/categories/two_letter_words.png';
  static const String categoryThreeLetterWords = 'assets/images/categories/three_letter_words.png';
  static const String categorySentences = 'assets/images/categories/sentences.png';
  
  # Icons
  static const String iconPlay = 'assets/images/icons/play_icon.png';
  static const String iconPause = 'assets/images/icons/pause_icon.png';
  static const String iconStop = 'assets/images/icons/stop_icon.png';
  static const String iconVolume = 'assets/images/icons/volume_icon.png';
  
  // ==================== SVG ====================
  
  // SVG Icons
  static const String svgIconPlay = 'assets/images/svg/icons/play.svg';
  static const String svgIconPause = 'assets/images/svg/icons/pause.svg';
  static const String svgIconStop = 'assets/images/svg/icons/stop.svg';
  static const String svgIconVolume = 'assets/images/svg/icons/volume.svg';
  static const String svgIconVolumeMute = 'assets/images/svg/icons/volume_mute.svg';
  static const String svgIconNext = 'assets/images/svg/icons/next.svg';
  static const String svgIconPrevious = 'assets/images/svg/icons/previous.svg';
  static const String svgIconCheck = 'assets/images/svg/icons/check.svg';
  static const String svgIconClose = 'assets/images/svg/icons/close.svg';
  static const String svgIconHome = 'assets/images/svg/icons/home.svg';
  static const String svgIconSettings = 'assets/images/svg/icons/settings.svg';
  static const String svgIconStar = 'assets/images/svg/icons/star.svg';
  static const String svgIconStarFilled = 'assets/images/svg/icons/star_filled.svg';
  static const String svgIconTrophy = 'assets/images/svg/icons/trophy.svg';
  
  // SVG Illustrations
  static const String svgIllustrationOnboarding1 = 'assets/images/svg/illustrations/onboarding_1.svg';
  static const String svgIllustrationOnboarding2 = 'assets/images/svg/illustrations/onboarding_2.svg';
  static const String svgIllustrationOnboarding3 = 'assets/images/svg/illustrations/onboarding_3.svg';
  static const String svgIllustrationEmptyState = 'assets/images/svg/illustrations/empty_state.svg';
  static const String svgIllustrationErrorState = 'assets/images/svg/illustrations/error_state.svg';
  static const String svgIllustrationSuccessState = 'assets/images/svg/illustrations/success_state.svg';
  
  // ==================== Audio ====================
  
  // Letters Base Path
  static const String audioLettersPath = 'assets/audio/letters/';
  
  // Letters
  static String getLetterAudio(String letterName) {
    return '$audioLettersPath$letterName.mp3';
  }
  
  // Segments
  static String getSegmentAudio(int lessonId, int wordId, int segmentNumber) {
    return 'assets/audio/segments/lesson_$lessonId/word_${wordId}_seg_$segmentNumber.mp3';
  }
  
  // Full Words
  static String getFullWordAudio(int lessonId, int wordId) {
    return 'assets/audio/words/lesson_$lessonId/word_${wordId}_full.mp3';
  }
  
  // ==================== Animations ====================
  
  static const String animationSplash = 'assets/animations/splash_animation.json';
  static const String animationLoading = 'assets/animations/loading_animation.json';
  static const String animationSuccess = 'assets/animations/success_animation.json';
  static const String animationError = 'assets/animations/error_animation.json';
  static const String animationCelebration = 'assets/animations/celebration_animation.json';
  
  // ==================== Fonts ====================
  
  static const String fontCairo = 'Cairo';
}
```

---

## 3. استخدام الصور في الكود

### مثال 1: عرض شعار التطبيق

```dart
// features/splash/presentation/pages/splash_page.dart
import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // عرض الشعار
            Image.asset(
              AssetsConstants.splashLogo,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
```

### مثال 2: عرض صور Onboarding

```dart
// features/onboarding/presentation/widgets/onboarding_page_widget.dart
import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class OnboardingPageWidget extends StatelessWidget {
  final int pageIndex;
  final String title;
  final String description;
  
  const OnboardingPageWidget({
    Key? key,
    required this.pageIndex,
    required this.title,
    required this.description,
  }) : super(key: key);
  
  String _getImagePath() {
    switch (pageIndex) {
      case 0:
        return AssetsConstants.onboarding1;
      case 1:
        return AssetsConstants.onboarding2;
      case 2:
        return AssetsConstants.onboarding3;
      default:
        return AssetsConstants.onboarding1;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          _getImagePath(),
          height: 300,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 40),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
```

### مثال 3: عرض أيقونات الفئات

```dart
// features/home/presentation/widgets/category_card.dart
import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/home/domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;
  
  const CategoryCard({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);
  
  String _getCategoryImage() {
    switch (category.id) {
      case 'letters':
        return AssetsConstants.categoryLetters;
      case 'two_letter_words':
        return AssetsConstants.categoryTwoLetterWords;
      case 'three_letter_words':
        return AssetsConstants.categoryThreeLetterWords;
      case 'sentences':
        return AssetsConstants.categorySentences;
      default:
        return AssetsConstants.categoryLetters;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _getCategoryImage(),
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 12),
              Text(
                category.name,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## 4. استخدام الملفات الصوتية

### مثال 1: تشغيل صوت حرف

```dart
// features/audio_player/presentation/widgets/letter_audio_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/audio_player/domain/entities/audio_file.dart';
import 'package:arabic_base/features/audio_player/presentation/cubit/audio_player_cubit.dart';

class LetterAudioButton extends StatelessWidget {
  final String letterName; // مثل: 'alef', 'baa', 'taa'
  final String letterText; // مثل: 'ا', 'ب', 'ت'
  
  const LetterAudioButton({
    Key? key,
    required this.letterName,
    required this.letterText,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final audioFile = AudioFile(
          id: 'letter_$letterName',
          url: AssetsConstants.getLetterAudio(letterName),
          type: AudioType.letter,
        );
        
        context.read<AudioPlayerCubit>().play(audioFile);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            letterText,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
```

### مثال 2: تشغيل صوت مقطع صوتي

```dart
// features/word_learning/presentation/widgets/phonetic_segment_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/word_learning/domain/entities/phonetic_segment.dart';
import 'package:arabic_base/features/audio_player/domain/entities/audio_file.dart';
import 'package:arabic_base/features/audio_player/presentation/cubit/audio_player_cubit.dart';

class PhoneticSegmentWidget extends StatelessWidget {
  final PhoneticSegment segment;
  final int lessonId;
  final int wordId;
  
  const PhoneticSegmentWidget({
    Key? key,
    required this.segment,
    required this.lessonId,
    required this.wordId,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        final isPlaying = state is AudioPlaying && 
                         state.audioId == 'segment_${segment.id}';
        
        return GestureDetector(
          onTap: () {
            final audioFile = AudioFile(
              id: 'segment_${segment.id}',
              url: AssetsConstants.getSegmentAudio(
                lessonId,
                wordId,
                segment.order,
              ),
              type: AudioType.segment,
            );
            
            context.read<AudioPlayerCubit>().play(audioFile);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: isPlaying 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isPlaying 
                    ? Theme.of(context).primaryColor 
                    : Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: Text(
              segment.text,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isPlaying ? Colors.white : Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }
}
```

### مثال 3: تشغيل صوت الكلمة الكاملة

```dart
// features/word_learning/presentation/widgets/word_display_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/word_learning/domain/entities/word.dart';
import 'package:arabic_base/features/audio_player/domain/entities/audio_file.dart';
import 'package:arabic_base/features/audio_player/presentation/cubit/audio_player_cubit.dart';

class WordDisplayWidget extends StatelessWidget {
  final Word word;
  final int lessonId;
  
  const WordDisplayWidget({
    Key? key,
    required this.word,
    required this.lessonId,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // عرض الكلمة
        Text(
          word.text,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        
        // زر تشغيل الكلمة الكاملة
        ElevatedButton.icon(
          onPressed: () {
            final audioFile = AudioFile(
              id: 'word_${word.id}_full',
              url: AssetsConstants.getFullWordAudio(
                lessonId,
                int.parse(word.id),
              ),
              type: AudioType.fullWord,
            );
            
            context.read<AudioPlayerCubit>().play(audioFile);
          },
          icon: const Icon(Icons.volume_up),
          label: const Text('استمع للكلمة كاملة'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
          ),
        ),
        const SizedBox(height: 30),
        
        // عرض المقاطع الصوتية
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: word.segments.map((segment) {
            return PhoneticSegmentWidget(
              segment: segment,
              lessonId: lessonId,
              wordId: int.parse(word.id),
            );
          }).toList(),
        ),
      ],
    );
  }
}
```

---

## 5. استخدام الخطوط

### إعداد الثيم مع الخط العربي

```dart
// core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    
    // استخدام خط Cairo
    fontFamily: AssetsConstants.fontCairo,
    
    // أنماط النصوص
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),
    
    // دعم RTL
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
```

### تعريف أنماط النصوص

```dart
// core/theme/app_text_styles.dart
import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class AppTextStyles {
  static const String _fontFamily = AssetsConstants.fontCairo;
  
  // Display Styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w700, // Bold
    height: 1.2,
  );
  
  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  
  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.2,
  );
  
  // Headline Styles
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  
  // Title Styles
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  // Body Styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    height: 1.5,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  // Label Styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
}
```

---

## 6. استخدام الرسوم المتحركة (Lottie)

### مثال: رسوم متحركة في Splash Screen

```dart
// features/splash/presentation/widgets/splash_animation_widget.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class SplashAnimationWidget extends StatelessWidget {
  const SplashAnimationWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AssetsConstants.animationSplash,
      width: 200,
      height: 200,
      fit: BoxFit.contain,
      repeat: true,
      animate: true,
    );
  }
}
```

### مثال: مؤشر تحميل مخصص

```dart
// shared/widgets/indicators/loading_indicator.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  
  const LoadingIndicator({
    Key? key,
    this.size = 100,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetsConstants.animationLoading,
        width: size,
        height: size,
        fit: BoxFit.contain,
      ),
    );
  }
}
```

### مثال: رسوم النجاح

```dart
// shared/widgets/dialogs/success_dialog.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class SuccessDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onClose;
  
  const SuccessDialog({
    Key? key,
    required this.message,
    this.onClose,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              AssetsConstants.animationSuccess,
              width: 150,
              height: 150,
              repeat: false,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onClose?.call();
              },
              child: const Text('حسناً'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 8. استخدام SVG

### مثال 1: أيقونة SVG بسيطة

```dart
// shared/widgets/buttons/icon_button_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class SvgIconButton extends StatelessWidget {
  final String svgPath;
  final VoidCallback onPressed;
  final double size;
  final Color? color;
  
  const SvgIconButton({
    Key? key,
    required this.svgPath,
    required this.onPressed,
    this.size = 24,
    this.color,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        svgPath,
        width: size,
        height: size,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      ),
    );
  }
}

// الاستخدام
SvgIconButton(
  svgPath: AssetsConstants.svgIconPlay,
  onPressed: () {
    // تشغيل الصوت
  },
  size: 32,
  color: Theme.of(context).primaryColor,
)
```

### مثال 2: رسم توضيحي SVG في Onboarding

```dart
// features/onboarding/presentation/widgets/onboarding_page_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class OnboardingPageWidget extends StatelessWidget {
  final int pageIndex;
  final String title;
  final String description;
  
  const OnboardingPageWidget({
    Key? key,
    required this.pageIndex,
    required this.title,
    required this.description,
  }) : super(key: key);
  
  String _getSvgPath() {
    switch (pageIndex) {
      case 0:
        return AssetsConstants.svgIllustrationOnboarding1;
      case 1:
        return AssetsConstants.svgIllustrationOnboarding2;
      case 2:
        return AssetsConstants.svgIllustrationOnboarding3;
      default:
        return AssetsConstants.svgIllustrationOnboarding1;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // رسم توضيحي SVG
        SvgPicture.asset(
          _getSvgPath(),
          height: 300,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 40),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
```

### مثال 3: زر تشغيل صوت مع أيقونة SVG

```dart
// features/audio_player/presentation/widgets/audio_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/audio_player/domain/entities/audio_file.dart';
import 'package:arabic_base/features/audio_player/presentation/cubit/audio_player_cubit.dart';

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
                  offset: const Offset(0, 2),
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
                : Center(
                    child: SvgPicture.asset(
                      isPlaying 
                          ? AssetsConstants.svgIconStop 
                          : AssetsConstants.svgIconVolume,
                      width: size * 0.5,
                      height: size * 0.5,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
```

### مثال 4: حالة فارغة مع SVG

```dart
// shared/widgets/states/empty_state_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final String? actionText;
  final VoidCallback? onAction;
  
  const EmptyStateWidget({
    Key? key,
    required this.message,
    this.actionText,
    this.onAction,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsConstants.svgIllustrationEmptyState,
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 24),
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          if (actionText != null && onAction != null) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onAction,
              child: Text(actionText!),
            ),
          ],
        ],
      ),
    );
  }
}
```

### مثال 5: أيقونات SVG في Navigation Bar

```dart
// shared/widgets/navigation/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  
  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.svgIconHome,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 0 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.svgIconStar,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 1 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'الممارسة',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.svgIconTrophy,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 2 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'التقدم',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetsConstants.svgIconSettings,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 3 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'الإعدادات',
        ),
      ],
    );
  }
}
```

### مزايا استخدام SVG

**1. قابلية التحجيم:**
- لا فقدان للجودة عند التكبير
- حجم ملف واحد لجميع الدقات

**2. التحكم بالألوان:**
```dart
// تغيير لون SVG من الكود
SvgPicture.asset(
  'icon.svg',
  colorFilter: ColorFilter.mode(
    Colors.blue,  // أي لون تريده
    BlendMode.srcIn,
  ),
)
```

**3. حجم ملف أصغر:**
- ملفات SVG عادة أصغر من PNG
- تحميل أسرع

**4. سهولة التعديل:**
- يمكن تعديل SVG في أي محرر نصوص
- سهولة التحسين والضغط

---

## 9. نصائح وأفضل الممارسات

### 1. استخدام const للأصول الثابتة

```dart
// ✅ صحيح
const Image.asset(AssetsConstants.splashLogo)

// ❌ خطأ
Image.asset(AssetsConstants.splashLogo)
```

### 2. التخزين المؤقت للصور

```dart
// استخدام CachedNetworkImage للصور من الإنترنت
// واستخدام precacheImage للصور المحلية

@override
void didChangeDependencies() {
  super.didChangeDependencies();
  precacheImage(
    AssetImage(AssetsConstants.splashLogo),
    context,
  );
}
```

### 3. معالجة الأخطاء

```dart
Image.asset(
  AssetsConstants.categoryLetters,
  errorBuilder: (context, error, stackTrace) {
    return const Icon(
      Icons.error_outline,
      size: 80,
      color: Colors.red,
    );
  },
)
```

### 4. التحميل المسبق للأصوات

```dart
// في initState أو didChangeDependencies
@override
void initState() {
  super.initState();
  _preloadAudios();
}

Future<void> _preloadAudios() async {
  final audios = [
    AudioFile(
      id: 'word_1_full',
      url: AssetsConstants.getFullWordAudio(1, 1),
      type: AudioType.fullWord,
    ),
    // ... المزيد من الأصوات
  ];
  
  await context.read<AudioPlayerCubit>().preloadAudios(audios);
}
```

---

## الخلاصة

الآن لديك دليل كامل لاستخدام جميع الأصول في التطبيق:
- ✅ الصور
- ✅ الملفات الصوتية
- ✅ الخطوط
- ✅ الرسوم المتحركة

تأكد من اتباع اصطلاحات التسمية والتنظيم للحفاظ على كود نظيف وسهل الصيانة.
