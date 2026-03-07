/// ثوابت مسارات الأصول
class AssetsConstants {
  AssetsConstants._();
  
  // ==================== Images ====================
  
  // Splash & Background
  static const String backgroundApp = 'assets/images/onboarding/background_app.png';
  static const String splashLogo = 'assets/images/splash/logo.png';
  static const String splashBackground = 'assets/images/splash/background.png';
  
  // Onboarding
  static const String onboarding1 = 'assets/images/onboarding/image 3.png';
  static const String onboarding2 = 'assets/images/onboarding/image2.png';
  static const String onboarding3 = 'assets/images/onboarding/image.png';
  
  // Categories
  static const String categoryLetters = 'assets/images/categories/letters.png';
  static const String categoryTwoLetterWords = 'assets/images/categories/two_letter_words.png';
  static const String categoryThreeLetterWords = 'assets/images/categories/three_letter_words.png';
  static const String categorySentences = 'assets/images/categories/sentences.png';
  
  // Icons
  static const String iconPlay = 'assets/images/icons/play_icon.png';
  static const String iconPause = 'assets/images/icons/pause_icon.png';
  static const String iconStop = 'assets/images/icons/stop_icon.png';
  static const String iconVolume = 'assets/images/icons/volume_icon.png';
  
  // ==================== SVG ====================
  
  // Logo
  static const String logo = 'assets/images/svg/illustrations/Logo.svg';
  
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
  static const String svgIconBook = 'assets/images/svg/icons/icon_book111.svg';
  
  // SVG Illustrations
  static const String svgIllustrationOnboarding1 = 'assets/images/svg/illustrations/image1.svg';
  static const String svgIllustrationOnboarding2 = 'assets/images/svg/illustrations/image2.svg';
  static const String svgIllustrationOnboarding3 = 'assets/images/svg/illustrations/image3.svg';
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
