# ArabicBase - معمارية المشروع

## نظرة عامة

ArabicBase هو تطبيق تعليمي يساعد المبتدئين والأطفال على تعلم قراءة الكلمات العربية باستخدام الصوتيات (Phonics).

## المفهوم الأساسي للتعلم

كل كلمة عربية يتم تقسيمها إلى مقاطع صوتية:

**مثال:**
- الكلمة: "كتب"
- المقاطع الصوتية: كـ | تـ | ب
- كل مقطع له ملف صوتي خاص
- يمكن الاستماع للكلمة كاملة

**تجربة المستخدم:**
1. المستخدم يرى الكلمة
2. ينقر على كل مقطع
3. يتم تشغيل صوت المقطع
4. يمكن تشغيل صوت الكلمة كاملة

## المعمارية المستخدمة

### Clean Architecture

المشروع يتبع مبادئ Clean Architecture مع ثلاث طبقات رئيسية:

```
┌─────────────────────────────────────┐
│     Presentation Layer              │
│  (UI, Widgets, State Management)    │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│       Domain Layer                  │
│  (Business Logic, Entities)         │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│        Data Layer                   │
│  (Repositories, DataSources)        │
└─────────────────────────────────────┘
```

## هيكل المجلدات الرئيسي

```
lib/
├── core/                 # الأدوات والموارد المشتركة
├── features/            # ميزات التطبيق
├── shared/              # الويدجتس المشتركة
├── injection_container.dart
└── main.dart
```

## الطبقات الثلاث

### 1. Presentation Layer (طبقة العرض)

**المسؤولية:** واجهة المستخدم والتفاعل

**المكونات:**
- **Pages:** شاشات التطبيق الكاملة
- **Widgets:** مكونات UI قابلة لإعادة الاستخدام
- **Cubit/Bloc:** إدارة الحالة (State Management)

**مثال:**
```
word_learning/presentation/
├── cubit/
│   ├── word_learning_cubit.dart
│   └── word_learning_state.dart
├── pages/
│   └── word_learning_page.dart
└── widgets/
    ├── word_display_widget.dart
    ├── phonetic_segment_widget.dart
    └── audio_control_widget.dart
```

### 2. Domain Layer (طبقة المنطق)

**المسؤولية:** منطق الأعمال (Business Logic)

**المكونات:**
- **Entities:** الكائنات الأساسية للتطبيق
- **Repositories:** العقود المجردة (Interfaces)
- **UseCases:** العمليات التجارية

**مثال:**
```
word_learning/domain/
├── entities/
│   ├── word.dart
│   └── phonetic_segment.dart
├── repositories/
│   └── word_repository.dart
└── usecases/
    ├── get_words_by_lesson.dart
    └── get_word_details.dart
```

**مبادئ:**
- مستقلة عن Flutter
- قابلة للاختبار بدون UI
- تحتوي على قواعد العمل

### 3. Data Layer (طبقة البيانات)

**المسؤولية:** إدارة البيانات والاتصال الخارجي

**المكونات:**
- **Models:** كائنات نقل البيانات (DTOs)
- **DataSources:**
  - Local: Hive/SharedPreferences
  - Remote: API calls via Dio
- **Repository Implementations:** تطبيقات المستودعات

**مثال:**
```
word_learning/data/
├── datasources/
│   ├── word_local_datasource.dart
│   └── word_remote_datasource.dart
├── models/
│   ├── word_model.dart
│   └── phonetic_segment_model.dart
└── repositories/
    └── word_repository_impl.dart
```

## الميزات (Features)

### 1. Splash Screen
- شعار التطبيق
- رسوم متحركة بسيطة
- التنقل إلى Onboarding

### 2. Onboarding (3 شاشات)
- تعلم العربية خطوة بخطوة
- الاستماع للأصوات الصوتية
- ممارسة القراءة يومياً

### 3. Home Screen
- الفئات الرئيسية للتعلم
- الوصول السريع للدروس

### 4. Lessons Screen
- قائمة الدروس
- أمثلة:
  - الحروف العربية
  - كلمات من حرفين
  - كلمات من ثلاثة حروف
  - جمل بسيطة

### 5. Word Learning Screen
- عرض الكلمة العربية
- المقاطع الصوتية
- تشغيل صوت كل مقطع
- تشغيل صوت الكلمة كاملة

### 6. Practice Screen
- ممارسة قراءة الكلمات
- تقييم الأداء

### 7. Progress Screen
- عرض الدروس المكتملة
- إحصائيات التقدم

## نظام الصوتيات (Audio System)

### معمارية نظام الصوت

```
audio_player/
├── domain/
│   ├── entities/
│   │   └── audio_file.dart
│   ├── repositories/
│   │   └── audio_repository.dart
│   └── usecases/
│       ├── play_audio.dart
│       ├── stop_audio.dart
│       ├── preload_audio.dart
│       └── pause_audio.dart
├── data/
│   ├── datasources/
│   │   ├── audio_cache_datasource.dart
│   │   └── audio_remote_datasource.dart
│   └── repositories/
│       └── audio_repository_impl.dart
└── presentation/
    ├── cubit/
    │   ├── audio_player_cubit.dart
    │   └── audio_player_state.dart
    └── widgets/
        └── audio_button.dart
```

### ميزات نظام الصوت

#### 1. استراتيجية التحميل المسبق (Preloading)
- تحميل ملفات الصوت عند دخول شاشة الدرس
- تخزين الأصوات المستخدمة بكثرة
- التحميل في الخلفية للدرس التالي

#### 2. إدارة التشغيل
- إيقاف الصوت السابق قبل تشغيل صوت جديد
- نظام قائمة انتظار للتشغيل المتسلسل
- التحكم في مستوى الصوت
- التحكم في سرعة التشغيل

#### 3. حالات مشغل الصوت
```
AudioPlayerStates:
- AudioInitial      (البداية)
- AudioLoading      (جاري التحميل)
- AudioPlaying      (قيد التشغيل)
- AudioPaused       (متوقف مؤقتاً)
- AudioStopped      (متوقف)
- AudioError        (خطأ)
```

#### 4. تنظيم ملفات الصوت
```
assets/audio/
├── letters/          # أصوات الحروف
│   ├── alef.mp3
│   ├── baa.mp3
│   └── ...
├── segments/         # أصوات المقاطع
│   ├── word_123_segment_1.mp3
│   ├── word_123_segment_2.mp3
│   └── ...
└── words/           # أصوات الكلمات الكاملة
    ├── word_123_full.mp3
    └── ...
```

## المكونات الأساسية (Core)

### 1. نظام التوجيه (Router)
```
core/router/
├── app_router.dart        # التنقل المركزي
└── route_guards.dart      # حماية المسارات
```

**الميزات:**
- التنقل المركزي
- Deep linking
- Route transitions
- حماية المسارات

### 2. حقن التبعيات (Dependency Injection)
```dart
injection_container.dart:
- تسجيل جميع التبعيات
- Singleton services (AudioPlayer, NetworkInfo)
- Factory instances (UseCases, Repositories)
- Lazy loading للأداء
```

### 3. معالجة الأخطاء
```
core/error/
├── failures.dart
│   - ServerFailure
│   - CacheFailure
│   - NetworkFailure
│   - AudioFailure
└── exceptions.dart
    - ServerException
    - CacheException
    - AudioException
```

### 4. نظام الثيمات (Theme)
```
core/theme/
├── app_colors.dart
├── app_text_styles.dart
└── app_theme.dart
```

**الميزات:**
- دعم الوضع الليلي/النهاري
- دعم RTL للعربية
- خطوط عربية مخصصة
- أنماط نصوص محسّنة للعربية

## الويدجتس المشتركة (Shared Widgets)

```
shared/
├── widgets/
│   ├── buttons/
│   │   ├── primary_button.dart
│   │   ├── secondary_button.dart
│   │   └── icon_button_widget.dart
│   ├── cards/
│   │   └── custom_card.dart
│   ├── dialogs/
│   │   ├── error_dialog.dart
│   │   └── success_dialog.dart
│   ├── indicators/
│   │   ├── loading_indicator.dart
│   │   └── progress_bar.dart
│   └── text/
│       ├── arabic_text.dart
│       └── styled_text.dart
└── animations/
    └── fade_in_animation.dart
```

## التقنيات المستخدمة

| المكون | التقنية |
|--------|---------|
| State Management | Bloc / Cubit |
| Dependency Injection | get_it |
| Networking | Dio |
| Local Storage | Hive / SharedPreferences |
| Audio Player | just_audio / audioplayers |
| Routing | go_router / auto_route |

## أفضل الممارسات

### 1. مبادئ Clean Architecture
- قاعدة التبعية: الطبقات الداخلية لا تعتمد على الخارجية
- Domain layer نقي (بدون Flutter imports)
- استخدام Dependency Injection
- Repository pattern لتجريد البيانات

### 2. إدارة الحالة
- استخدام Cubit للمنطق البسيط
- استخدام Bloc للسيناريوهات المعقدة
- فصل منطق الأعمال عن UI
- States غير قابلة للتغيير (Immutable)

### 3. تنظيم الكود
- كلاس واحد لكل ملف
- هيكل قائم على الميزات
- الويدجتس المشتركة في مجلد shared
- أدوات Core متاحة لجميع الميزات

### 4. أفضل ممارسات الصوتيات
- التحميل المسبق لتجنب التأخير
- التخلص من مشغلات الصوت بشكل صحيح
- معالجة انقطاعات الصوت (المكالمات)
- إدارة تركيز الصوت
- تخزين ملفات الصوت للاستخدام دون اتصال

### 5. تحسين الأداء
- Lazy loading للميزات
- تخزين الصور والصوتيات مؤقتاً
- Pagination للقوائم الكبيرة
- Debounce للتفاعلات
- استخدام const constructors

### 6. استراتيجية الاختبار
```
test/
├── unit/              # اختبارات الوحدة
│   ├── domain/
│   └── data/
├── widget/            # اختبارات الويدجت
│   └── presentation/
└── integration/       # اختبارات التكامل
```

### 7. الترجمة (Localization)
- دعم العربية (RTL)
- دعم الإنجليزية (LTR)
- استخدام intl package
- ملفات ترجمة منفصلة

## قابلية التوسع (Scalability)

### 1. توسيع الميزات
- إضافة ميزات جديدة كوحدات منفصلة
- الحفاظ على حدود واضحة بين الميزات
- استخدام الويدجتس المشتركة للاتساق
- الحفاظ على أدوات Core عامة

### 2. إدارة البيانات
- نهج offline-first
- آلية المزامنة لتقدم المستخدم
- التحكم في إصدارات المحتوى
- استراتيجية الترحيل لتغييرات قاعدة البيانات

### 3. قابلية توسع الصوتيات
- CDN لتوصيل ملفات الصوت
- الضغط لأحجام ملفات أصغر
- البث للملفات الكبيرة
- استراتيجية التنزيل التدريجي

### 4. مراقبة الأداء
- تكامل Analytics
- تقارير الأعطال
- مقاييس الأداء
- تتبع سلوك المستخدم

### 5. إدارة المحتوى
- فصل المحتوى عن الكود
- هيكل محتوى قائم على JSON
- Remote config لميزات التبديل
- إمكانية A/B testing

## اصطلاحات التسمية

| النوع | الاصطلاح | مثال |
|------|----------|------|
| Files | snake_case | word_learning_page.dart |
| Classes | PascalCase | WordLearningPage |
| Variables | camelCase | currentWord |
| Constants | UPPER_SNAKE_CASE | MAX_AUDIO_DURATION |

## الخلاصة

هذه المعمارية توفر أساساً قوياً لبناء تطبيق تعليمي قابل للصيانة والاختبار والتوسع، مع التركيز على:
- فصل المسؤوليات
- قابلية إعادة الاستخدام
- سهولة الاختبار
- الأداء العالي
- تجربة مستخدم ممتازة
