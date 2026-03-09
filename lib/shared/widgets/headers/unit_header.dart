import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';

class UnitHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;

  const UnitHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.paddingLarge),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: AppTextStyles.headingSmall.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                TextSpan(
                  text: ' : ',
                  style: AppTextStyles.headingSmall,
                ),
                TextSpan(
                  text: subtitle,
                  style: AppTextStyles.headingSmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: AppConstants.spacingLarge),
          
          _buildProgressBar(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppConstants.progressBarHeight,
            decoration: BoxDecoration(
              color: AppColors.divider.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusSmall,
              ),
            ),
          ),
        ),
        
        SizedBox(width: AppConstants.spacingMedium),
        
        Text(
          'التقدم العام',
          style: AppTextStyles.titleLarge,
        ),
        
        SizedBox(width: AppConstants.spacingMedium),
        
        Text(
          '${(progress * 100).toInt()}%',
          style: AppTextStyles.percentageLarge,
        ),
        
        SizedBox(width: AppConstants.spacingMedium),
        
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: AppConstants.progressBarHeight,
                    decoration: BoxDecoration(
                      color: AppColors.divider.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(
                        AppConstants.borderRadiusSmall,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: constraints.maxWidth * progress,
                      height: AppConstants.progressBarHeight,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          AppConstants.borderRadiusSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
