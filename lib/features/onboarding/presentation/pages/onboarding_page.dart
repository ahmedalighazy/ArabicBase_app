import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/onboarding/domain/entities/onboarding.dart';
import 'package:arabic_base/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:arabic_base/features/onboarding/presentation/widgets/page_indicator.dart';
import 'package:arabic_base/shared/widgets/common/app_logo_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<Onboarding> _pages = const [
    Onboarding(
      image: AssetsConstants.onboarding1,
      title: 'ابدأ من الحروف العربية… خطوة بخطوة',
      description: '',
    ),
    Onboarding(
      image: AssetsConstants.onboarding2,
      title: '.اسمع النطق الصحيح للحرف بضغطة واحدة',
      description: '',
    ),
    Onboarding(
      image: AssetsConstants.onboarding3,
      title: '.تدرّب يومياً لتقرأ بإتقان وبأساس قوي',
      description: '',
    ),
  ];

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      vsync: this,
      duration: AppConstants.animationDuration,
    );
    
    _slideController = AnimationController(
      vsync: this,
      duration: AppConstants.animationDuration,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    // بدء الأنيميشن للصفحة الأولى
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    
    // إعادة تشغيل الأنيميشن
    _fadeController.reset();
    _slideController.reset();
    _fadeController.forward();
    _slideController.forward();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: AppConstants.pageTransitionDuration,
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/lessons');
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, '/lessons');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5F3), // لون الخلفية الفاتح
      body: SafeArea(
        child: Column(
          children: [
            // الشعار في الأعلى
            Padding(
              padding: EdgeInsets.only(
                top: AppConstants.paddingXXLarge,
                bottom: AppConstants.paddingLarge,
              ),
              child: const AppLogoText(),
            ),
            
            // محتوى الصفحات
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: OnboardingContent(
                        image: _pages[index].image,
                        title: _pages[index].title,
                        description: _pages[index].description,
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // المؤشرات
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppConstants.paddingXLarge,
              ),
              child: PageIndicator(
                currentPage: _currentPage,
                pageCount: _pages.length,
              ),
            ),
            
            // الأزرار
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.paddingLarge,
                vertical: AppConstants.paddingXXLarge,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // زر تخطي
                  TextButton(
                    onPressed: _skip,
                    child: Text(
                      'تخطي',
                      style: TextStyle(
                        fontFamily: AssetsConstants.fontCairo,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  
                  // زر التالي/البدء
                  ElevatedButton(
                    onPressed: _nextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _currentPage == _pages.length - 1 ? 'هيا نبدأ' : '',
                          style: TextStyle(
                            fontFamily: AssetsConstants.fontCairo,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
