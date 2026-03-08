import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson_item.dart';
import 'package:arabic_base/shared/widgets/cards/lesson_item_card.dart';
import 'package:arabic_base/shared/widgets/navigation/bottom_nav_bar.dart';

/// صفحة وحدة المقدمة
class UnitIntroductionPage extends StatelessWidget {
  const UnitIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: ListView(
                    padding: EdgeInsets.only(
                      bottom: AppConstants.paddingLarge,
                    ),
                    children: _getLessonItems().map((item) {
                      return LessonItemCard(
                        item: item,
                        onTap: () {
                          // TODO: Navigate to lesson/training content
                          print('Tapped on: ${item.title}');
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 1) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.paddingLarge),
      child: Column(
        children: [
          // العنوان بدون زر رجوع
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'مقدمة',
                  style: AppTextStyles.headingSmall.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                TextSpan(
                  text: ' : ',
                  style: AppTextStyles.headingSmall,
                ),
                TextSpan(
                  text: 'حروف الهجاء العربية',
                  style: AppTextStyles.headingSmall.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: AppConstants.spacingLarge),
          
          // التقدم العام
          _buildProgressBar(0.2),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double progress) {
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

  List<LessonItem> _getLessonItems() {
    return [
      LessonItem(
        id: 'intro_lesson',
        title: 'الدروس',
        subtitle: 'درس واحد في هذه الوحدة.',
        iconPath: AssetsConstants.svgIconLesson,
        totalItems: 1,
        completedItems: 0,
        progress: 0.0,
        type: LessonItemType.lesson,
      ),
      LessonItem(
        id: 'intro_training',
        title: 'التدريبات',
        subtitle: 'تدريب واحد في هذه الوحدة.',
        iconPath: AssetsConstants.svgIconTraining,
        totalItems: 1,
        completedItems: 0,
        progress: 0.0,
        type: LessonItemType.training,
      ),
    ];
  }
}
