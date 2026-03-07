import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/features/onboarding/presentation/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _circleController;
  
  late Animation<double> _logoScaleAnimation;
  late Animation<Offset> _arabicSlideAnimation;
  late Animation<Offset> _baseSlideAnimation;
  late Animation<double> _circleScaleAnimation;

  @override
  void initState() {
    super.initState();
    
    // Logo Animation Controller (0-1.5s)
    _logoController = AnimationController(
      vsync: this,
      duration: AppConstants.splashLogoAnimationDuration,
    );

    // Text Animation Controller (1-2.5s)
    _textController = AnimationController(
      vsync: this,
      duration: AppConstants.splashTextAnimationDuration,
    );

    // Circle Animation Controller (2.5-4s)
    _circleController = AnimationController(
      vsync: this,
      duration: AppConstants.splashCircleAnimationDuration,
    );

    // Logo Scale Animation (أصغر → كبير ويثبت)
    _logoScaleAnimation = Tween<double>(
      begin: 0.1, // أصغر من الأول
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.easeOutBack,
      ),
    );

    // Arabic Text Slide (من بعيد خارج الشاشة الشمال → النص)
    _arabicSlideAnimation = Tween<Offset>(
      begin: const Offset(-5.0, 0), // أبعد من الأول
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeOutCubic,
      ),
    );

    // Base Text Slide (من بعيد خارج الشاشة اليمين → النص)
    _baseSlideAnimation = Tween<Offset>(
      begin: const Offset(5.0, 0), // أبعد من الأول
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeOutCubic,
      ),
    );

    // Circle Scale Animation (صغير → يغطي الشاشة)
    _circleScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: Curves.easeInOut,
      ),
    );

    // Start animations sequence
    _startAnimations();
  }

  void _startAnimations() async {
    // التلاتة يبدأوا في نفس الوقت ويوصلوا للنص مع بعض
    await Future.wait([
      _logoController.forward(),
      _textController.forward(),
    ]);
    
    // بعد ما يتمركزوا، الدائرة الخضراء تبدأ
    await _circleController.forward();
    
    // Navigate to onboarding
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final maxDimension = screenWidth > screenHeight ? screenWidth : screenHeight;
    
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image (ثابتة)
          Positioned.fill(
            child: Image.asset(
              AssetsConstants.backgroundApp,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.white);
              },
            ),
          ),
          
          // 2. Circular Reveal Animation (الدائرة الخضراء)
          AnimatedBuilder(
            animation: _circleController,
            builder: (context, child) {
              return ClipPath(
                clipper: CircularRevealClipper(
                  fraction: _circleScaleAnimation.value,
                  centerX: screenWidth / 2,
                  centerY: screenHeight / 2,
                  minRadius: 0,
                  maxRadius: maxDimension * 1.5,
                ),
                child: Container(
                  color: AppColors.primaryBg,
                ),
              );
            },
          ),
          
          // 3. Logo and Text (فوق كل حاجة) - يتحركوا مع بعض
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Animation (يكبر)
                ScaleTransition(
                  scale: _logoScaleAnimation,
                  child: SvgPicture.asset(
                    AssetsConstants.logo,
                    width: screenWidth * 0.50,
                    height: screenWidth * 0.25,
                    fit: BoxFit.contain,
                  ),
                ),
                
                SizedBox(height: AppConstants.spacingMedium),
                
                // Text Animations (يجوا من الجنبين)
                ClipRect(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Arabic (من الشمال)
                      SlideTransition(
                        position: _arabicSlideAnimation,
                        child: Text(
                          'Arabic',
                          style: AppTextStyles.displaySmall,
                        ),
                      ),
                      // Base (من اليمين)
                      SlideTransition(
                        position: _baseSlideAnimation,
                        child: Text(
                          'Base.',
                          style: AppTextStyles.displayLarge.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Circular Reveal Animation
class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final double centerX;
  final double centerY;
  final double minRadius;
  final double maxRadius;

  CircularRevealClipper({
    required this.fraction,
    required this.centerX,
    required this.centerY,
    this.minRadius = 0,
    required this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = minRadius + (maxRadius - minRadius) * fraction;
    
    path.addOval(
      Rect.fromCircle(
        center: Offset(centerX, centerY),
        radius: radius,
      ),
    );
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
