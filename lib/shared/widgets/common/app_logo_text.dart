import 'package:flutter/material.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';

/// نص شعار التطبيق (ArabicBase)
class AppLogoText extends StatelessWidget {
  final double? fontSize;
  
  const AppLogoText({
    super.key,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final size = fontSize ?? 40;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Arabic',
          style: AppTextStyles.displayLarge.copyWith(
            fontSize: size,
            color: AppColors.primary,
          ),
        ),
        Text(
          'Base',
          style: AppTextStyles.displayLarge.copyWith(
            fontSize: size,
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
