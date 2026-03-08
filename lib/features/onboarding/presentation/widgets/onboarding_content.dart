import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';

class OnboardingContent extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<OnboardingContent> createState() => _OnboardingContentState();
}

class _OnboardingContentState extends State<OnboardingContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<double> _imageScaleAnimation;
  late Animation<double> _imageFadeAnimation;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Scale Animation (صغير → كبير)
    _imageScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: Curves.easeOutBack,
      ),
    );

    // Fade Animation
    _imageFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _imageController,
        curve: Curves.easeOut,
      ),
    );

    // بدء الأنيميشن
    _imageController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        
        // الصورة التوضيحية مع أنيميشن
        ScaleTransition(
          scale: _imageScaleAnimation,
          child: FadeTransition(
            opacity: _imageFadeAnimation,
            child: Image.asset(
              widget.image,
              width: screenWidth * 0.6,
              height: screenWidth * 0.6,
              fit: BoxFit.contain,
            ),
          ),
        ),
        
        const Spacer(flex: 1),
        
        // العنوان
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.paddingXXLarge,
          ),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.headingMedium,
          ),
        ),
        
        SizedBox(height: AppConstants.spacingLarge),
        
        // الوصف
        if (widget.description.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.paddingXXLarge,
            ),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
          ),
        
        const Spacer(flex: 2),
      ],
    );
  }
}
