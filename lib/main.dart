import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/splash/presentation/pages/splash_page.dart';
import 'package:arabic_base/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:arabic_base/features/lessons/presentation/pages/lessons_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // إعداد شريط الحالة
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const ArabicBaseApp());
}

class ArabicBaseApp extends StatelessWidget {
  const ArabicBaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArabicBase',
      debugShowCheckedModeBanner: false,
      
      // الثيم
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
        fontFamily: AssetsConstants.fontCairo,
        scaffoldBackgroundColor: AppColors.background,
        
        // دعم RTL للعربية
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      // الشاشة الأولى
      home: const SplashPage(),
      
      // الروتات
      routes: {
        '/splash': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/lessons': (context) => const LessonsPage(),
      },
    );
  }
}
