# دليل شاشات Onboarding

## نظرة عامة

شاشات Onboarding هي أول تجربة للمستخدم مع التطبيق. تم تصميمها لتكون:
- بسيطة وواضحة
- جذابة بصرياً
- سريعة (3 شاشات فقط)
- مع أنيميشن سلس

---

## الشاشات الثلاث

### 1. الشاشة الأولى - التعريف بالمحتوى

**الصورة:** `assets/images/svg/illustrations/image1.svg`

**العنوان:**
```
ابدأ من الحروف العربية… خطوة بخطوة
```

**الهدف:** تعريف المستخدم بأن التطبيق يبدأ من الأساسيات

---

### 2. الشاشة الثانية - الميزة الأساسية

**الصورة:** `assets/images/svg/illustrations/image2.svg`

**العنوان:**
```
اسمع النطق الصحيح للحرف بضغطة واحدة.
```

**الهدف:** توضيح الميزة الصوتية التفاعلية

---

### 3. الشاشة الثالثة - التشجيع

**الصورة:** `assets/images/svg/illustrations/image3.svg`

**العنوان:**
```
تدرّب يومياً لتقرأ بإتقان وبأساس قوي.
```

**الهدف:** تحفيز المستخدم على الاستمرار

---

## التصميم

### الألوان

```dart
الخلفية: #E8F5F3 (أخضر فاتح جداً)
النص الرئيسي: #212121 (رمادي غامق)
النص الثانوي: #757575 (رمادي)
الأزرار: Primary (#007F6D) و Secondary (#F28705)
```

### الخطوط

```dart
العنوان: Cairo Bold - 24px
الوصف: Cairo Regular - 16px
الأزرار: Cairo Bold - 16px
```

### المسافات

```dart
الشعار من الأعلى: 40px
المسافة بين العنوان والوصف: 16px
المؤشرات من الأسفل: 24px
الأزرار من الأسفل: 32px
```

---

## الأنيميشن

### نوع الأنيميشن

كل صفحة تحتوي على:

1. **Fade Animation**
   - من شفاف (0.0) إلى واضح (1.0)
   - المدة: 600ms
   - Curve: easeOut

2. **Slide Animation**
   - من اليمين (0.3, 0) إلى المركز (0, 0)
   - المدة: 600ms
   - Curve: easeOut

### متى يحدث الأنيميشن؟

- عند فتح الشاشة لأول مرة
- عند التمرير لصفحة جديدة
- يتم إعادة تشغيل الأنيميشن لكل صفحة

---

## المكونات

### 1. OnboardingPage

الصفحة الرئيسية التي تحتوي على:
- PageView للتمرير بين الصفحات
- PageIndicator لعرض الصفحة الحالية
- أزرار التنقل (تخطي / التالي)

```dart
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}
```

### 2. OnboardingContent

ويدجت لعرض محتوى كل صفحة:
- الصورة التوضيحية (SVG)
- العنوان
- الوصف (إذا وجد)

```dart
class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  
  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
}
```

### 3. PageIndicator

مؤشرات الصفحات (النقاط):
- نقطة طويلة للصفحة الحالية
- نقاط صغيرة للصفحات الأخرى
- أنيميشن سلس عند التغيير

```dart
class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  
  const PageIndicator({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);
}
```

---

## التفاعل

### زر "تخطي"

- الموقع: أعلى اليسار
- اللون: Secondary (برتقالي)
- الوظيفة: الانتقال مباشرة للشاشة الرئيسية

### زر "التالي" / "هيا نبدأ"

- الموقع: أسفل اليمين
- اللون: Primary (أخضر)
- الشكل: دائري مع أيقونة سهم
- النص:
  - الصفحات 1 و 2: أيقونة سهم فقط
  - الصفحة 3: "هيا نبدأ" + سهم

### التمرير

- يمكن التمرير بالسحب (Swipe)
- أنيميشن سلس بين الصفحات
- المدة: 400ms

---

## الاستخدام

### من Splash Screen

```dart
Future.delayed(const Duration(seconds: 3), () {
  if (mounted) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }
});
```

### التحقق من أول تشغيل

```dart
// في المستقبل، يمكن إضافة:
final isFirstLaunch = await checkFirstLaunch();

if (isFirstLaunch) {
  // عرض Onboarding
  Navigator.push(context, OnboardingPage());
} else {
  // الذهاب للشاشة الرئيسية
  Navigator.push(context, HomePage());
}
```

---

## الملفات المطلوبة

### الصور (SVG)

يجب وضع الصور في:
```
assets/images/svg/illustrations/
├── image1.svg  (كتاب مع مكعبات ABC)
├── image2.svg  (يد تضغط على بطاقة حرف)
└── image3.svg  (دفتر مع قلم وعلامات صح)
```

### المواصفات

- الصيغة: SVG
- الحجم الموصى به: 300x300 px
- الألوان: متناسقة مع ثيم التطبيق
- الأسلوب: Flat design / Illustration

---

## التخصيص

### تغيير عدد الصفحات

```dart
final List<Onboarding> _pages = const [
  Onboarding(
    image: AssetsConstants.svgIllustrationOnboarding1,
    title: 'العنوان الأول',
    description: 'الوصف الأول',
  ),
  // أضف المزيد هنا
];
```

### تغيير الألوان

في `lib/core/theme/app_colors.dart`:
```dart
static const Color primary = Color(0xFF007F6D);
static const Color secondary = Color(0xFFF28705);
```

### تغيير مدة الأنيميشن

```dart
_fadeController = AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 600), // غير هنا
);
```

---

## أفضل الممارسات

### 1. النصوص

- ✅ قصيرة ومباشرة
- ✅ واضحة وسهلة الفهم
- ✅ تركز على الفوائد
- ❌ لا تكون طويلة أو معقدة

### 2. الصور

- ✅ بسيطة وواضحة
- ✅ ملونة وجذابة
- ✅ تعبر عن المحتوى
- ❌ لا تكون مزدحمة بالتفاصيل

### 3. الأنيميشن

- ✅ سلس وسريع
- ✅ لا يشتت الانتباه
- ✅ يعزز تجربة المستخدم
- ❌ لا يكون بطيئاً أو معقداً

### 4. التنقل

- ✅ سهل وواضح
- ✅ يمكن التخطي
- ✅ يظهر التقدم
- ❌ لا يجبر المستخدم على المشاهدة

---

## الاختبار

### سيناريوهات الاختبار

1. ✅ فتح التطبيق لأول مرة
2. ✅ التمرير بين الصفحات
3. ✅ الضغط على "تخطي"
4. ✅ الضغط على "التالي"
5. ✅ الضغط على "هيا نبدأ"
6. ✅ الأنيميشن يعمل بشكل صحيح
7. ✅ المؤشرات تتحدث بشكل صحيح

---

## الخلاصة

شاشات Onboarding جاهزة ومصممة بشكل احترافي مع:
- ✅ تصميم نظيف وبسيط
- ✅ أنيميشن سلس وجميل
- ✅ تجربة مستخدم ممتازة
- ✅ كود نظيف وقابل للصيانة
- ✅ دعم كامل للعربية (RTL)

**الآن ضع الصور الثلاث وشغل التطبيق!** 🚀
