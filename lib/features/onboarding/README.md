# Onboarding Feature

## الوصف
شاشات التعريف بالتطبيق (Onboarding) التي تظهر للمستخدم في أول مرة.

## الشاشات

### الشاشة الأولى
- **الصورة:** `image1.svg`
- **العنوان:** ابدأ من الحروف العربية… خطوة بخطوة

### الشاشة الثانية
- **الصورة:** `image2.svg`
- **العنوان:** اسمع النطق الصحيح للحرف بضغطة واحدة.

### الشاشة الثالثة
- **الصورة:** `image3.svg`
- **العنوان:** تدرّب يومياً لتقرأ بإتقان وبأساس قوي.

## الميزات

- ✅ أنيميشن سلس للانتقال بين الصفحات
- ✅ Fade و Slide animation لكل صفحة
- ✅ مؤشرات الصفحات (Page Indicators)
- ✅ زر "تخطي" للانتقال المباشر
- ✅ زر "هيا نبدأ" في الصفحة الأخيرة
- ✅ تصميم RTL للعربية
- ✅ ألوان متناسقة مع الشعار

## الاستخدام

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const OnboardingPage(),
  ),
);
```

## الملفات

```
onboarding/
├── domain/
│   └── entities/
│       └── onboarding.dart
└── presentation/
    ├── pages/
    │   └── onboarding_page.dart
    └── widgets/
        ├── onboarding_content.dart
        └── page_indicator.dart
```
