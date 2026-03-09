import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
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

    _imageController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        
        ScaleTransition(
          scale: _imageScaleAnimation,
          child: FadeTransition(
            opacity: _imageFadeAnimation,
            child: Image.asset(
              widget.image,
              width: 213,
              height: 237,
              fit: BoxFit.contain,
            ),
          ),
        ),
        
        SizedBox(height: 10),
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
              height: 21 / 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF046855),
            ),
          ),
        ),
        
        SizedBox(height: AppConstants.spacingLarge),
        
        if (widget.description.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
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
