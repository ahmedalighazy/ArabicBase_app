import 'package:flutter/material.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_gradients.dart';
import 'package:arabic_base/core/constants/app_constants.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final double? height;
  final bool rtl;
  
  const ProgressBar({
    super.key,
    required this.progress,
    this.height,
    this.rtl = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height ?? AppConstants.progressBarHeight,
          decoration: BoxDecoration(
            color: AppColors.divider.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          ),
        ),
        FractionallySizedBox(
          alignment: rtl ? Alignment.centerRight : Alignment.centerLeft,
          widthFactor: progress.clamp(0.0, 1.0),
          child: Container(
            height: height ?? AppConstants.progressBarHeight,
            decoration: BoxDecoration(
              gradient: AppGradients.primaryGradient,
              borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
            ),
          ),
        ),
      ],
    );
  }
}
