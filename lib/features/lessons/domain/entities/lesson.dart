class Lesson {
  final String id;
  final String title;
  final String subtitle;
  final int totalLessons;
  final int completedLessons;
  final int totalExercises;
  final int completedExercises;
  final double progress;
  final bool isLocked;

  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.totalLessons,
    required this.completedLessons,
    required this.totalExercises,
    required this.completedExercises,
    required this.progress,
    this.isLocked = false,
  });

  bool get isCompleted => progress >= 1.0;
}
