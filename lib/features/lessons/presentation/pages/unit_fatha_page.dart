import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson_item.dart';
import 'package:arabic_base/shared/widgets/layouts/unit_page_layout.dart';

class UnitFathaPage extends StatelessWidget {
  const UnitFathaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UnitPageLayout(
      title: 'الوحدة الأولى',
      subtitle: 'الفَتْـــــــــــحَة',
      progress: 0.0,
      items: _getLessonItems(),
    );
  }

  List<LessonItem> _getLessonItems() {
    return [
      LessonItem(
        id: 'fatha_lesson',
        title: 'الدروس',
        subtitle: 'درس واحد في هذه الوحدة.',
        iconPath: AssetsConstants.svgIconLesson,
        totalItems: 1,
        completedItems: 0,
        progress: 0.0,
        type: LessonItemType.lesson,
      ),
      LessonItem(
        id: 'fatha_training',
        title: 'التدريبات',
        subtitle: 'تدريبان في هذه الوحدة.',
        iconPath: AssetsConstants.svgIconTraining,
        totalItems: 2,
        completedItems: 0,
        progress: 0.0,
        type: LessonItemType.training,
      ),
    ];
  }
}
