import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/core/utils/responsive.dart';
import 'package:arabic_base/core/navigation/unit_navigator.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson.dart';
import 'package:arabic_base/shared/widgets/buttons/primary_button.dart';
import 'package:arabic_base/shared/widgets/progress/progress_bar.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  const LessonCard({
    super.key,
    required this.lesson,
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
            _buildTitle(),
            _buildDivider(),
            Expanded(child: _buildContent()),
            _buildDivider(),
            SizedBox(height: AppConstants.spacingLarge),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.paddingXLarge,
        vertical: AppConstants.spacingMedium,
      ),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: lesson.title,
                style: AppTextStyles.headingSmall.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              TextSpan(
                text: ' : ',
                style: AppTextStyles.headingSmall,
              ),
              TextSpan(
                text: lesson.subtitle,
                style: AppTextStyles.headingSmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // التقدم على اليسار
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // التقدم والنسبة في صف واحد
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(lesson.progress * 100).toInt()}%',
                      style: AppTextStyles.percentage,
                    ),
                    Text(
                      'التقدم',
                      style: AppTextStyles.titleSmall,
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.spacingSmall),
                // الشريط
                ProgressBar(progress: lesson.progress),
              ],
            ),
          ),
          
          SizedBox(width: AppConstants.spacingXLarge),
          
          // الدروس والتدريبات والأيقونة على اليمين
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'دروس : ${lesson.completedLessons}/${lesson.totalLessons}',
                    style: AppTextStyles.bodySmall,
                  ),
                  SizedBox(height: AppConstants.spacingSmall),
                  Text(
                    'تدريبات : ${lesson.completedExercises}/${lesson.totalExercises}',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
              SizedBox(width: AppConstants.spacingMedium),
              SvgPicture.asset(
                AssetsConstants.svgIconBook,
                width: AppConstants.iconSizeLarge,
                height: AppConstants.iconSizeLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.paddingXLarge,
        0,
        AppConstants.paddingXLarge,
        AppConstants.spacingMedium,
      ),
      child: PrimaryButton(
        text: lesson.isLocked ? 'مغلق' : 'عرض الدروس',
        icon: Icons.arrow_forward_outlined,
        onPressed: lesson.isLocked ? null : () {
          print('Navigating to unit: ${lesson.id}');
          UnitNavigator.navigateToUnit(context, lesson.id);
        },
        isDisabled: lesson.isLocked,
      ),
    );
  }
}
