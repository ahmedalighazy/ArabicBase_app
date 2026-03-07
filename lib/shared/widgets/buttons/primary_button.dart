import 'package:flutter/material.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_gradients.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/core/constants/app_constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isDisabled;
  final double? height;
  final double? borderRadius;
  
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isDisabled = false,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? AppConstants.buttonHeight,
      decoration: BoxDecoration(
        gradient: isDisabled ? null : AppGradients.primaryGradientWithMiddle,
        color: isDisabled ? AppColors.divider : null,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppConstants.borderRadiusMedium,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppConstants.borderRadiusMedium,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: AppConstants.iconSizeSmall,
                    color: isDisabled ? AppColors.textSecondary : Colors.white,
                  ),
                  SizedBox(width: AppConstants.spacingSmall),
                ],
                Text(
                  text,
                  style: AppTextStyles.buttonLarge.copyWith(
                    color: isDisabled ? AppColors.textSecondary : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
