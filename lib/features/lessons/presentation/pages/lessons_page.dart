import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson.dart';
import 'package:arabic_base/shared/widgets/cards/lesson_card.dart';
import 'package:arabic_base/shared/widgets/navigation/bottom_nav_bar.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  int _currentNavIndex = 1;

  @override
  Widget build(BuildContext context) {
    final lessons = _getDemoLessons();
    
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
                _buildHeader(context, lessons),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      bottom: AppConstants.paddingLarge,
                    ),
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      return LessonCard(lesson: lessons[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
          // TODO: Navigate to different pages based on index
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, List<Lesson> lessons) {
    final totalProgress = lessons.fold<double>(
      0.0,
      (sum, lesson) => sum + lesson.progress,
    ) / lessons.length;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppConstants.paddingLarge,
        AppConstants.paddingLarge,
        AppConstants.paddingLarge,
        AppConstants.spacingMedium,
      ),
      child: Column(
        children: [
          // العنوان
          Text(
            'الفهرس التعليمي',
            style: AppTextStyles.displayMedium,
          ),
          
          SizedBox(height: AppConstants.spacingMedium),
          
          // النص الفرعي
          Text(
            'استعرض الوحدات وواصل التعلّم خطوة بخطوة',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge,
          ),
          
          SizedBox(height: AppConstants.spacingXLarge),
          
          // التقدم العام
          Row(
            children: [
              // الخط الأيمن (فاضي)
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
              // النسبة المئوية (برتقالي)
              Text(
                '${(totalProgress * 100).toInt()}%',
                style: AppTextStyles.percentageLarge,
              ),
              SizedBox(width: AppConstants.spacingMedium),
              // النص
              Text(
                'التقدم العام',
                style: AppTextStyles.titleLarge,
              ),

              SizedBox(width: AppConstants.spacingMedium),
              
              // الخط الأيسر (ممتلئ بنسبة التقدم من اليمين)
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        // الخلفية (فاضي)
                        Container(
                          height: AppConstants.progressBarHeight,
                          decoration: BoxDecoration(
                            color: AppColors.divider.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(
                              AppConstants.borderRadiusSmall,
                            ),
                          ),
                        ),
                        // الممتلئ (من اليمين لليسار)
                        Positioned(
                          right: 0, // يبدأ من اليمين
                          child: Container(
                            width: constraints.maxWidth * totalProgress,
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
          ),
        ],
      ),
    );
  }

  List<Lesson> _getDemoLessons() {
    return [
      const Lesson(
        id: '1',
        title: 'مقدمة',
        subtitle: 'حروف الهجاء العربية',
        totalLessons: 1,
        completedLessons: 0,
        totalExercises: 1,
        completedExercises: 0,
        progress: 0.2,
        isLocked: false,
      ),
      const Lesson(
        id: '2',
        title: 'الوحدة الأولى',
        subtitle: 'الفَتْـــــــــــحَة',
        totalLessons: 1,
        completedLessons: 0,
        totalExercises: 2,
        completedExercises: 0,
        progress: 0.0,
        isLocked: false,
      ),
      const Lesson(
        id: '3',
        title: 'الوحدة الثانية',
        subtitle: 'الكَــــــسْرَة',
        totalLessons: 1,
        completedLessons: 0,
        totalExercises: 2,
        completedExercises: 0,
        progress: 0.0,
        isLocked: false,
      ),
      const Lesson(
        id: '4',
        title: 'الوحدة الثالثة',
        subtitle: 'الضَّــــــمَّة',
        totalLessons: 1,
        completedLessons: 0,
        totalExercises: 2,
        completedExercises: 0,
        progress: 0.0,
        isLocked: false,
      ),
    ];
  }
}
