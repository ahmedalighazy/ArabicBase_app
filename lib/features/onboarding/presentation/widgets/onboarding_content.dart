import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

class OnboardingContent extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        
        // الصورة التوضيحية (PNG)
        Image.asset(
          image,
          width: screenWidth * 0.6,
          height: screenWidth * 0.6,
          fit: BoxFit.contain,
        ),
        
        const Spacer(flex: 1),
        
        // العنوان
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.paddingXXLarge,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.headingMedium,
          ),
        ),
        
        SizedBox(height: AppConstants.spacingLarge),
        
        // الوصف
        if (description.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.paddingXXLarge,
            ),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium,
            ),
          ),
        
        const Spacer(flex: 2),
      ],
    );
  }
}
