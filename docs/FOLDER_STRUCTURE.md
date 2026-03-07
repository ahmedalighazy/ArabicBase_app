# ArabicBase - هيكل المجلدات الكامل

## الهيكل الكامل للمشروع

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   ├── audio_constants.dart
│   │   └── route_constants.dart
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── extensions/
│   │   ├── context_extensions.dart
│   │   └── string_extensions.dart
│   ├── network/
│   │   ├── api_client.dart
│   │   └── network_info.dart
│   ├── router/
│   │   ├── app_router.dart
│   │   └── route_guards.dart
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart
│   ├── usecases/
│   │   └── usecase.dart
│   └── utils/
│       ├── audio_utils.dart
│       ├── logger.dart
│       └── validators.dart
│
├── features/
│   ├── splash/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── splash_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── app_config_model.dart
│   │   │   └── repositories/
│   │   │       └── splash_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── app_config.dart
│   │   │   ├── repositories/
│   │   │   │   └── splash_repository.dart
│   │   │   └── usecases/
│   │   │       └── check_first_launch.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── splash_cubit.dart
│   │       │   └── splash_state.dart
│   │       ├── pages/
│   │       │   └── splash_page.dart
│   │       └── widgets/
│   │           └── splash_animation_widget.dart
│   │
│   ├── onboarding/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── onboarding_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── onboarding_model.dart
│   │   │   └── repositories/
│   │   │       └── onboarding_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── onboarding.dart
│   │   │   ├── repositories/
│   │   │   │   └── onboarding_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_onboarding_pages.dart
│   │   │       └── complete_onboarding.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── onboarding_cubit.dart
│   │       │   └── onboarding_state.dart
│   │       ├── pages/
│   │       │   └── onboarding_page.dart
│   │       └── widgets/
│   │           ├── onboarding_page_widget.dart
│   │           └── page_indicator.dart
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── category_local_datasource.dart
│   │   │   │   └── category_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── category_model.dart
│   │   │   └── repositories/
│   │   │       └── category_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── category.dart
│   │   │   ├── repositories/
│   │   │   │   └── category_repository.dart
│   │   │   └── usecases/
│   │   │       └── get_categories.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── home_cubit.dart
│   │       │   └── home_state.dart
│   │       ├── pages/
│   │       │   └── home_page.dart
│   │       └── widgets/
│   │           ├── category_card.dart
│   │           └── home_header.dart
│   │
│   ├── lessons/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── lesson_local_datasource.dart
│   │   │   │   └── lesson_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── lesson_model.dart
│   │   │   └── repositories/
│   │   │       └── lesson_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── lesson.dart
│   │   │   ├── repositories/
│   │   │   │   └── lesson_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_lessons_by_category.dart
│   │   │       └── mark_lesson_completed.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── lessons_cubit.dart
│   │       │   └── lessons_state.dart
│   │       ├── pages/
│   │       │   └── lessons_page.dart
│   │       └── widgets/
│   │           ├── lesson_card.dart
│   │           └── lesson_progress_indicator.dart
│   │
│   ├── word_learning/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── word_local_datasource.dart
│   │   │   │   └── word_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── word_model.dart
│   │   │   │   └── phonetic_segment_model.dart
│   │   │   └── repositories/
│   │   │       └── word_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── word.dart
│   │   │   │   └── phonetic_segment.dart
│   │   │   ├── repositories/
│   │   │   │   └── word_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_words_by_lesson.dart
│   │   │       └── get_word_details.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── word_learning_cubit.dart
│   │       │   └── word_learning_state.dart
│   │       ├── pages/
│   │       │   └── word_learning_page.dart
│   │       └── widgets/
│   │           ├── word_display_widget.dart
│   │           ├── phonetic_segment_widget.dart
│   │           └── audio_control_widget.dart
│   │
│   ├── practice/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── practice_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── practice_session_model.dart
│   │   │   │   └── practice_result_model.dart
│   │   │   └── repositories/
│   │   │       └── practice_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── practice_session.dart
│   │   │   │   └── practice_result.dart
│   │   │   ├── repositories/
│   │   │   │   └── practice_repository.dart
│   │   │   └── usecases/
│   │   │       ├── start_practice_session.dart
│   │   │       └── save_practice_result.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── practice_cubit.dart
│   │       │   └── practice_state.dart
│   │       ├── pages/
│   │       │   └── practice_page.dart
│   │       └── widgets/
│   │           ├── practice_word_widget.dart
│   │           └── practice_feedback_widget.dart
│   │
│   ├── progress/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── progress_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── user_progress_model.dart
│   │   │   └── repositories/
│   │   │       └── progress_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_progress.dart
│   │   │   ├── repositories/
│   │   │   │   └── progress_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_user_progress.dart
│   │   │       └── update_progress.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── progress_cubit.dart
│   │       │   └── progress_state.dart
│   │       ├── pages/
│   │       │   └── progress_page.dart
│   │       └── widgets/
│   │           ├── progress_chart_widget.dart
│   │           └── completed_lessons_list.dart
│   │
│   └── audio_player/
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── audio_cache_datasource.dart
│       │   │   └── audio_remote_datasource.dart
│       │   ├── models/
│       │   │   └── audio_file_model.dart
│       │   └── repositories/
│       │       └── audio_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── audio_file.dart
│       │   ├── repositories/
│       │   │   └── audio_repository.dart
│       │   └── usecases/
│       │       ├── play_audio.dart
│       │       ├── stop_audio.dart
│       │       ├── preload_audio.dart
│       │       └── pause_audio.dart
│       └── presentation/
│           ├── cubit/
│           │   ├── audio_player_cubit.dart
│           │   └── audio_player_state.dart
│           └── widgets/
│               ├── audio_button.dart
│               └── audio_visualizer.dart
│
├── shared/
│   ├── widgets/
│   │   ├── buttons/
│   │   │   ├── primary_button.dart
│   │   │   ├── secondary_button.dart
│   │   │   └── icon_button_widget.dart
│   │   ├── cards/
│   │   │   └── custom_card.dart
│   │   ├── dialogs/
│   │   │   ├── error_dialog.dart
│   │   │   └── success_dialog.dart
│   │   ├── indicators/
│   │   │   ├── loading_indicator.dart
│   │   │   └── progress_bar.dart
│   │   └── text/
│   │       ├── arabic_text.dart
│   │       └── styled_text.dart
│   └── animations/
│       └── fade_in_animation.dart
│
├── injection_container.dart
└── main.dart
```

## شرح المجلدات الرئيسية

### 📁 core/
المجلد الأساسي الذي يحتوي على الأدوات والموارد المشتركة في جميع أنحاء التطبيق.

#### constants/
- `app_constants.dart` - ثوابت التطبيق العامة
- `audio_constants.dart` - ثوابت خاصة بالصوتيات
- `route_constants.dart` - أسماء المسارات

#### error/
- `exceptions.dart` - الاستثناءات المخصصة
- `failures.dart` - أنواع الفشل المختلفة

#### extensions/
- `context_extensions.dart` - امتدادات BuildContext
- `string_extensions.dart` - امتدادات String

#### network/
- `api_client.dart` - عميل API (Dio)
- `network_info.dart` - فحص الاتصال بالإنترنت

#### router/
- `app_router.dart` - نظام التوجيه المركزي
- `route_guards.dart` - حماية المسارات

#### theme/
- `app_colors.dart` - ألوان التطبيق
- `app_text_styles.dart` - أنماط النصوص
- `app_theme.dart` - ثيم التطبيق

#### usecases/
- `usecase.dart` - الكلاس الأساسي لجميع UseCases

#### utils/
- `audio_utils.dart` - أدوات مساعدة للصوتيات
- `logger.dart` - نظام السجلات
- `validators.dart` - التحقق من المدخلات

---

### 📁 features/
يحتوي على جميع ميزات التطبيق، كل ميزة في مجلد منفصل.

#### هيكل كل ميزة:
```
feature_name/
├── data/           # طبقة البيانات
├── domain/         # طبقة المنطق
└── presentation/   # طبقة العرض
```

---

### 📁 features/splash/
شاشة البداية (Splash Screen)

**الغرض:**
- عرض شعار التطبيق
- رسوم متحركة بسيطة
- التحقق من أول تشغيل
- التوجيه إلى الشاشة المناسبة

**الملفات الرئيسية:**
- `splash_page.dart` - شاشة Splash
- `splash_cubit.dart` - إدارة حالة Splash
- `check_first_launch.dart` - التحقق من أول تشغيل

---

### 📁 features/onboarding/
شاشات التعريف بالتطبيق (3 شاشات)

**الغرض:**
- تعريف المستخدم بالتطبيق
- شرح كيفية الاستخدام
- حفظ حالة إكمال Onboarding

**الملفات الرئيسية:**
- `onboarding_page.dart` - شاشة Onboarding
- `onboarding_page_widget.dart` - صفحة واحدة من Onboarding
- `page_indicator.dart` - مؤشر الصفحات
- `complete_onboarding.dart` - حفظ إكمال Onboarding

---

### 📁 features/home/
الشاشة الرئيسية

**الغرض:**
- عرض الفئات الرئيسية
- الوصول السريع للدروس
- عرض التقدم العام

**الملفات الرئيسية:**
- `home_page.dart` - الشاشة الرئيسية
- `category_card.dart` - بطاقة الفئة
- `get_categories.dart` - جلب الفئات

**الكيانات:**
- `category.dart` - كيان الفئة (ID, Name, Icon, Description)

---

### 📁 features/lessons/
شاشة الدروس

**الغرض:**
- عرض قائمة الدروس حسب الفئة
- تتبع تقدم الدروس
- تحديد الدروس المكتملة

**الملفات الرئيسية:**
- `lessons_page.dart` - شاشة الدروس
- `lesson_card.dart` - بطاقة الدرس
- `lesson_progress_indicator.dart` - مؤشر تقدم الدرس
- `get_lessons_by_category.dart` - جلب الدروس
- `mark_lesson_completed.dart` - تحديد الدرس كمكتمل

**الكيانات:**
- `lesson.dart` - كيان الدرس (ID, Title, Category, IsCompleted, Words)

---

### 📁 features/word_learning/
شاشة تعلم الكلمات (الشاشة الأساسية)

**الغرض:**
- عرض الكلمة العربية
- تقسيم الكلمة إلى مقاطع صوتية
- تشغيل صوت كل مقطع
- تشغيل صوت الكلمة كاملة

**الملفات الرئيسية:**
- `word_learning_page.dart` - شاشة تعلم الكلمة
- `word_display_widget.dart` - عرض الكلمة
- `phonetic_segment_widget.dart` - عرض المقطع الصوتي
- `audio_control_widget.dart` - أزرار التحكم بالصوت
- `get_words_by_lesson.dart` - جلب كلمات الدرس
- `get_word_details.dart` - جلب تفاصيل الكلمة

**الكيانات:**
- `word.dart` - كيان الكلمة (ID, Text, FullAudioUrl, Segments)
- `phonetic_segment.dart` - كيان المقطع الصوتي (ID, Text, AudioUrl, Order)

**مثال على البيانات:**
```dart
Word(
  id: '1',
  text: 'كتب',
  fullAudioUrl: 'assets/audio/words/word_1_full.mp3',
  segments: [
    PhoneticSegment(id: '1', text: 'كـ', audioUrl: 'assets/audio/segments/word_1_seg_1.mp3', order: 1),
    PhoneticSegment(id: '2', text: 'تـ', audioUrl: 'assets/audio/segments/word_1_seg_2.mp3', order: 2),
    PhoneticSegment(id: '3', text: 'ب', audioUrl: 'assets/audio/segments/word_1_seg_3.mp3', order: 3),
  ]
)
```

---

### 📁 features/practice/
شاشة الممارسة

**الغرض:**
- ممارسة قراءة الكلمات
- تقييم أداء المستخدم
- حفظ نتائج الممارسة

**الملفات الرئيسية:**
- `practice_page.dart` - شاشة الممارسة
- `practice_word_widget.dart` - عرض كلمة الممارسة
- `practice_feedback_widget.dart` - عرض التغذية الراجعة
- `start_practice_session.dart` - بدء جلسة ممارسة
- `save_practice_result.dart` - حفظ نتيجة الممارسة

**الكيانات:**
- `practice_session.dart` - جلسة الممارسة
- `practice_result.dart` - نتيجة الممارسة

---

### 📁 features/progress/
شاشة التقدم

**الغرض:**
- عرض الدروس المكتملة
- إحصائيات التقدم
- الإنجازات

**الملفات الرئيسية:**
- `progress_page.dart` - شاشة التقدم
- `progress_chart_widget.dart` - رسم بياني للتقدم
- `completed_lessons_list.dart` - قائمة الدروس المكتملة
- `get_user_progress.dart` - جلب تقدم المستخدم
- `update_progress.dart` - تحديث التقدم

**الكيانات:**
- `user_progress.dart` - تقدم المستخدم

---

### 📁 features/audio_player/
نظام تشغيل الصوتيات (الميزة الأهم)

**الغرض:**
- تشغيل الملفات الصوتية
- إدارة حالة التشغيل
- التحميل المسبق للصوتيات
- التخزين المؤقت

**الملفات الرئيسية:**
- `audio_player_cubit.dart` - إدارة حالة مشغل الصوت
- `audio_button.dart` - زر تشغيل الصوت
- `audio_visualizer.dart` - مؤشر بصري للصوت
- `play_audio.dart` - تشغيل الصوت
- `stop_audio.dart` - إيقاف الصوت
- `preload_audio.dart` - التحميل المسبق
- `pause_audio.dart` - إيقاف مؤقت

**الكيانات:**
- `audio_file.dart` - ملف الصوت (ID, URL, Duration, Type)

**حالات مشغل الصوت:**
```dart
sealed class AudioPlayerState {}
class AudioInitial extends AudioPlayerState {}
class AudioLoading extends AudioPlayerState {}
class AudioPlaying extends AudioPlayerState {
  final String audioId;
  final Duration position;
}
class AudioPaused extends AudioPlayerState {}
class AudioStopped extends AudioPlayerState {}
class AudioError extends AudioPlayerState {
  final String message;
}
```

---

### 📁 shared/
الويدجتس والمكونات المشتركة

#### widgets/buttons/
- `primary_button.dart` - الزر الأساسي
- `secondary_button.dart` - الزر الثانوي
- `icon_button_widget.dart` - زر أيقونة

#### widgets/cards/
- `custom_card.dart` - بطاقة مخصصة

#### widgets/dialogs/
- `error_dialog.dart` - نافذة الخطأ
- `success_dialog.dart` - نافذة النجاح

#### widgets/indicators/
- `loading_indicator.dart` - مؤشر التحميل
- `progress_bar.dart` - شريط التقدم

#### widgets/text/
- `arabic_text.dart` - نص عربي مخصص
- `styled_text.dart` - نص منسق

#### animations/
- `fade_in_animation.dart` - رسوم متحركة للظهور

---

### 📄 injection_container.dart
ملف حقن التبعيات (Dependency Injection)

**المسؤولية:**
- تسجيل جميع التبعيات
- إنشاء Singleton instances
- إنشاء Factory instances

**مثال:**
```dart
final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => SplashCubit(sl()));
  sl.registerFactory(() => AudioPlayerCubit(sl(), sl(), sl()));
  
  // UseCases
  sl.registerLazySingleton(() => PlayAudio(sl()));
  sl.registerLazySingleton(() => StopAudio(sl()));
  
  // Repositories
  sl.registerLazySingleton<AudioRepository>(
    () => AudioRepositoryImpl(sl(), sl())
  );
  
  // DataSources
  sl.registerLazySingleton<AudioCacheDataSource>(
    () => AudioCacheDataSourceImpl()
  );
  
  // External
  sl.registerLazySingleton(() => AudioPlayer());
}
```

---

### 📄 main.dart
نقطة البداية للتطبيق

**المسؤولية:**
- تهيئة التطبيق
- تهيئة التبعيات
- إعداد الثيم
- إعداد الروتر

---

## تنظيم ملفات الأصول (Assets)

```
assets/
├── images/
│   ├── logo.png
│   ├── onboarding/
│   │   ├── onboarding_1.png
│   │   ├── onboarding_2.png
│   │   └── onboarding_3.png
│   └── categories/
│       ├── letters.png
│       ├── words.png
│       └── sentences.png
│
├── audio/
│   ├── letters/
│   │   ├── alef.mp3
│   │   ├── baa.mp3
│   │   ├── taa.mp3
│   │   └── ...
│   ├── segments/
│   │   ├── word_1_segment_1.mp3
│   │   ├── word_1_segment_2.mp3
│   │   └── ...
│   └── words/
│       ├── word_1_full.mp3
│       ├── word_2_full.mp3
│       └── ...
│
└── fonts/
    ├── Cairo-Regular.ttf
    ├── Cairo-Bold.ttf
    └── Cairo-SemiBold.ttf
```

---

## ملاحظات مهمة

### 1. اصطلاحات التسمية
- **Files:** snake_case (مثل: `word_learning_page.dart`)
- **Classes:** PascalCase (مثل: `WordLearningPage`)
- **Variables:** camelCase (مثل: `currentWord`)
- **Constants:** UPPER_SNAKE_CASE (مثل: `MAX_AUDIO_DURATION`)

### 2. قواعد الاستيراد
```dart
// 1. Dart imports
import 'dart:async';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. Package imports
import 'package:flutter_bloc/flutter_bloc.dart';

// 4. Project imports
import 'package:arabic_base/core/constants/app_constants.dart';
```

### 3. تنظيم الملفات
- كل كلاس في ملف منفصل
- اسم الملف يطابق اسم الكلاس (بصيغة snake_case)
- الملفات المرتبطة في نفس المجلد

### 4. التعليقات
- استخدم تعليقات واضحة بالعربية أو الإنجليزية
- وثق الدوال المعقدة
- اشرح منطق الأعمال المهم

---

## الخلاصة

هذا الهيكل يوفر:
- ✅ فصل واضح للمسؤوليات
- ✅ سهولة في الصيانة
- ✅ قابلية للتوسع
- ✅ سهولة في الاختبار
- ✅ تنظيم احترافي
