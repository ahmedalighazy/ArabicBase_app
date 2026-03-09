import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/core/utils/responsive.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson_item.dart';
import 'package:arabic_base/shared/widgets/buttons/primary_button.dart';
import 'package:arabic_base/shared/widgets/progress/progress_bar.dart';

class LessonItemCard extends StatelessWidget {
  final LessonItem item;
  final VoidCallback onTap;

  const LessonItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      width: AppConstants.lessonCardWidth,
      height: AppConstants.lessonCardHeight,
      margin: EdgeInsets.symmetric(
        horizontal: responsive.wp(5.3),
        vertical: responsive.hp(1.2),
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: AppConstants.opacityHigh),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
        border: Border.all(
          color: AppColors.borderPrimary,
          width: AppConstants.borderWidthThick,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderPrimary.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            _buildDivider(),
            Expanded(child: _buildContent()),
            _buildDivider(),
            SizedBox(height: AppConstants.spacingLarge),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingXLarge,
        vertical: AppConstants.spacingMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            item.title,
            style: AppTextStyles.headingSmall.copyWith(
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: AppConstants.spacingMedium),
          SvgPicture.asset(
            item.iconPath,
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: AppConstants.borderWidthThin,
      margin: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingXLarge,
      ),
      color: AppColors.primaryLight.withValues(alpha: 0.3),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingXLarge,
        vertical: AppConstants.spacingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.subtitle,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ),
          
          SizedBox(height: AppConstants.spacingLarge),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${item.completedItems}/${item.totalItems}',
                style: AppTextStyles.percentage.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              Text(
                'التقدم',
                style: AppTextStyles.titleSmall,
              ),
            ],
          ),
          
          SizedBox(height: AppConstants.spacingSmall),
          
          ProgressBar(progress: item.progress),
        ],
      ),
    );
  }

  Widget _buildButton() {
    final buttonText = item.type == LessonItemType.lesson 
        ? 'عرض الدرس' 
        : 'عرض التدريبات';
    
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.paddingXLarge,
        0,
        AppConstants.paddingXLarge,
        AppConstants.spacingMedium,
      ),
      child: PrimaryButton(
        text: buttonText,
        icon: Icons.arrow_forward,
        onPressed: onTap,
      ),
    );
  }
}
