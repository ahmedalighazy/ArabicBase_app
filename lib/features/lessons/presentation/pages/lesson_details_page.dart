import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson_item.dart';
import 'package:arabic_base/shared/widgets/cards/lesson_item_card.dart';

/// صفحة تفاصيل الوحدة
class LessonDetailsPage extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailsPage({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    final items = _getLessonItems();
    
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsConstants.backgroundApp),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),
            ),
          ),
          
          // أيقونة الكتاب الكبيرة في المنتصف
          Center(
            child: Opacity(
              opacity: 0.3,
              child: Icon(
                Icons.menu_book_rounded,
                size: AppConstants.iconSizeXLarge,
                color: AppColors.primary,
              ),
            ),
          ),
          
          // المحتوى
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      bottom: AppConstants.paddingLarge,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return LessonItemCard(
                        item: items[index],
                        onTap: () {
                          // TODO: Navigate to lesson/training content
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.paddingLarge),
      child: Column(
        children: [
          // زر الرجوع والعنوان
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                ),
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: lesson.title,
                        style: AppTextStyles.headingSmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: ' : ',
                        style: AppTextStyles.headingSmall,
                      ),
                      TextSpan(
                        text: lesson.subtitle,
                        style: AppTextStyles.headingSmall.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 48), // للتوازن مع زر الرجوع
            ],
          ),
          
          SizedBox(height: AppConstants.spacingLarge),
          
          // التقدم العام
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
          '${(lesson.progress * 100).toInt()}%',
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
                      width: constraints.maxWidth * lesson.progress,
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

  List<LessonItem> _getLessonItems() {
    return [
      LessonItem(
        id: '${lesson.id}_lesson',
        title: 'الدروس',
        subtitle: 'درس واحد في هذه الوحدة.',
        iconPath: AssetsConstants.svgIconLesson,
        totalItems: lesson.totalLessons,
        completedItems: lesson.completedLessons,
        progress: lesson.totalLessons > 0 
            ? lesson.completedLessons / lesson.totalLessons 
            : 0.0,
        type: LessonItemType.lesson,
      ),
      LessonItem(
        id: '${lesson.id}_training',
        title: 'التدريبات',
        subtitle: '${lesson.totalExercises} تدريبات في هذه الوحدة.',
        iconPath: AssetsConstants.svgIconTraining,
        totalItems: lesson.totalExercises,
        completedItems: lesson.completedExercises,
        progress: lesson.totalExercises > 0 
            ? lesson.completedExercises / lesson.totalExercises 
            : 0.0,
        type: LessonItemType.training,
      ),
    ];
  }
}
