/// عنصر داخل الوحدة (درس أو تدريب)
class LessonItem {
  final String id;
  final String title;
  final String subtitle;
  final String iconPath;
  final int totalItems;
  final int completedItems;
  final double progress;
  final LessonItemType type;

  const LessonItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.totalItems,
    required this.completedItems,
    required this.progress,
    required this.type,
  });
}

enum LessonItemType {
  lesson,
  training,
}
