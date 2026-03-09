import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson_item.dart';
import 'package:arabic_base/shared/widgets/layouts/unit_page_layout.dart';

class UnitIntroductionPage extends StatelessWidget {
  const UnitIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UnitPageLayout(
      title: 'مقدمة',
      subtitle: 'حروف الهجاء العربية',
      progress: 0.2,
      items: _getLessonItems(),
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
