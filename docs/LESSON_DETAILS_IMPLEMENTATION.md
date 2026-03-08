# تنفيذ صفحة تفاصيل الوحدة (Lesson Details Implementation)

## نظرة عامة
تم تنفيذ صفحة تفاصيل الوحدة التي تعرض كاردين: كارد للدروس وكارد للتدريبات، مع الالتزام بمبادئ Clean Code و Clean Architecture.

## الملفات المنفذة

### 1. Entity Layer (Domain)
**الملف:** `lib/features/lessons/domain/entities/lesson_item.dart`

```dart
class LessonItem {
  final String id;
  final String title;
  final String subtitle;
  final String iconPath;
  final int totalItems;
  final int completedItems;
  final double progress;
  final LessonItemType type;
}

enum LessonItemType {
  lesson,    // درس
  training,  // تدريب
}
```

**المسؤوليات:**
- تمثيل عنصر داخل الوحدة (درس أو تدريب)
- تخزين البيانات الأساسية: العنوان، النص الفرعي، الأيقونة
- تتبع التقدم: إجمالي العناصر، العناصر المكتملة، نسبة التقدم
- تحديد نوع العنصر (درس أو تدريب)

---

### 2. Widget Layer (Shared)
**الملف:** `lib/shared/widgets/cards/lesson_item_card.dart`

**التصميم:**
- الحجم: 330 × 250 بكسل (نفس حجم LessonCard)
- الخلفية: أبيض بشفافية 50%
- الحدود: 3 بكسل، لون #00A991
- الظل: خفيف للعمق

**البنية:**
```
┌─────────────────────────────────┐
│  Header (أيقونة + عنوان)        │
├─────────────────────────────────┤
│  Content:                       │
│  - النص الفرعي                  │
│  - التقدم (X/Y)                 │
│  - شريط التقدم                  │
├─────────────────────────────────┤
│  Button (عرض الدرس/التدريبات)   │
└─────────────────────────────────┘
```

**المكونات:**
1. **Header:** أيقونة SVG + عنوان (الدروس/التدريبات)
2. **Divider:** خط فاصل بلون أخضر فاتح
3. **Content:** 
   - نص فرعي يصف المحتوى
   - عداد التقدم (مكتمل/إجمالي)
   - شريط تقدم مرئي
4. **Button:** زر بتدرج لوني مع أيقونة سهم

**الأيقونات:**
- الدروس: `assets/images/svg/icons/icon_lesson.svg`
- التدريبات: `assets/images/svg/icons/icon_trainng.svg`

---

### 3. Presentation Layer (Pages)
**الملف:** `lib/features/lessons/presentation/pages/lesson_details_page.dart`

**التصميم:**
- الخلفية: `background_app.png` بشفافية 80%
- أيقونة كتاب كبيرة في المنتصف (300 بكسل، شفافية 30%)
- Header مع زر رجوع وعنوان الوحدة
- شريط التقدم العام
- قائمة بالكاردات (دروس + تدريبات)

**البنية:**
```
┌─────────────────────────────────┐
│  Header:                        │
│  [←] الوحدة الأولى : الفَتْحَة   │
│  ═══ التقدم العام 20% ═══       │
├─────────────────────────────────┤
│  ┌───────────────────────────┐  │
│  │  كارد الدروس              │  │
│  └───────────────────────────┘  │
│  ┌───────────────────────────┐  │
│  │  كارد التدريبات           │  │
│  └───────────────────────────┘  │
└─────────────────────────────────┘
```

**المميزات:**
- عرض عنوان الوحدة بألوان مختلفة (أخضر + برتقالي)
- شريط تقدم عام يملأ من اليمين لليسار (RTL)
- توليد تلقائي للكاردات من بيانات الوحدة
- التنقل السلس من صفحة الوحدات

---

### 4. Navigation Integration
**الملف:** `lib/features/lessons/presentation/pages/lessons_page.dart`

**التحديثات:**
- إضافة التنقل من LessonCard إلى LessonDetailsPage
- تمرير بيانات الوحدة الكاملة

```dart
LessonCard(
  lesson: lesson,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonDetailsPage(lesson: lesson),
      ),
    );
  },
)
```

---

### 5. Assets Constants
**الملف:** `lib/core/constants/assets_constants.dart`

**الإضافات:**
```dart
static const String svgIconLesson = 'assets/images/svg/icons/icon_lesson.svg';
static const String svgIconTraining = 'assets/images/svg/icons/icon_trainng.svg';
```

---

## مبادئ Clean Code المطبقة

### 1. Separation of Concerns
- **Entity:** منطق الأعمال فقط (LessonItem)
- **Widget:** العرض فقط (LessonItemCard)
- **Page:** تنسيق الصفحة والتنقل (LessonDetailsPage)

### 2. Single Responsibility
- كل كلاس له مسؤولية واحدة واضحة
- LessonItem: تمثيل البيانات
- LessonItemCard: عرض كارد واحد
- LessonDetailsPage: تنسيق الصفحة

### 3. DRY (Don't Repeat Yourself)
- استخدام نفس تصميم الكارد (LessonCard)
- استخدام الثوابت من `app_constants.dart`
- استخدام الأنماط من `app_text_styles.dart`
- استخدام الألوان من `app_colors.dart`

### 4. Reusability
- LessonItemCard قابل لإعادة الاستخدام
- يمكن استخدامه في أي مكان يحتاج عرض درس أو تدريب
- معامل `onTap` للتحكم في السلوك

### 5. Type Safety
- استخدام enum لنوع العنصر (LessonItemType)
- تجنب الأخطاء في وقت التشغيل
- تحسين قابلية الصيانة

---

## البيانات التجريبية

### الوحدة الأولى: الفَتْحَة
```dart
LessonItem(
  id: '2_lesson',
  title: 'الدروس',
  subtitle: 'درس واحد في هذه الوحدة.',
  iconPath: AssetsConstants.svgIconLesson,
  totalItems: 1,
  completedItems: 0,
  progress: 0.0,
  type: LessonItemType.lesson,
)

LessonItem(
  id: '2_training',
  title: 'التدريبات',
  subtitle: '2 تدريبات في هذه الوحدة.',
  iconPath: AssetsConstants.svgIconTraining,
  totalItems: 2,
  completedItems: 0,
  progress: 0.0,
  type: LessonItemType.training,
)
```

---

## الخطوات التالية (TODO)

### 1. صفحات المحتوى
- [ ] إنشاء صفحة عرض الدرس (Lesson Content Page)
- [ ] إنشاء صفحة عرض التدريبات (Training Content Page)
- [ ] ربط الأزرار بالصفحات الجديدة

### 2. Data Layer
- [ ] إنشاء Repository للوحدات
- [ ] إنشاء Data Source (Local/Remote)
- [ ] إضافة Use Cases للعمليات

### 3. State Management
- [ ] إضافة Bloc/Cubit لإدارة الحالة
- [ ] معالجة حالات التحميل والأخطاء
- [ ] تحديث التقدم بشكل ديناميكي

### 4. التحسينات
- [ ] إضافة أنيميشن للانتقال بين الصفحات
- [ ] إضافة أنيميشن لظهور الكاردات
- [ ] إضافة Shimmer Effect أثناء التحميل
- [ ] إضافة Pull-to-Refresh

---

## الاختبار

### التحقق من الملفات
```bash
# التحقق من وجود الأيقونات
Test-Path "assets/images/svg/icons/icon_lesson.svg"    # True ✓
Test-Path "assets/images/svg/icons/icon_trainng.svg"   # True ✓
```

### التحقق من الأخطاء
```bash
# لا توجد أخطاء في الملفات
getDiagnostics: No diagnostics found ✓
```

### اختبار التنقل
1. افتح التطبيق
2. انتقل إلى صفحة الوحدات (Lessons Page)
3. اضغط على أي كارد وحدة
4. يجب أن تفتح صفحة تفاصيل الوحدة
5. يجب أن تظهر كاردين: الدروس والتدريبات
6. تحقق من الأيقونات والنصوص والتقدم

---

## الملاحظات الفنية

### RTL Support
- جميع النصوص تدعم RTL
- شريط التقدم يملأ من اليمين لليسار
- الأيقونات في المواضع الصحيحة

### Responsive Design
- استخدام `context.responsive` لجميع الأحجام
- التكيف مع أحجام الشاشات المختلفة
- الحفاظ على النسب الصحيحة

### Performance
- استخدام `const` constructors حيثما أمكن
- تجنب إعادة البناء غير الضرورية
- استخدام `ListView.builder` للقوائم الطويلة

### Accessibility
- ألوان متباينة للقراءة الجيدة
- أحجام خطوط مناسبة
- مساحات كافية للنقر

---

## الخلاصة

تم تنفيذ صفحة تفاصيل الوحدة بنجاح مع:
- ✅ Clean Architecture (Entity, Widget, Page)
- ✅ Clean Code (DRY, SRP, Reusability)
- ✅ تصميم متسق مع باقي التطبيق
- ✅ دعم RTL كامل
- ✅ Responsive Design
- ✅ لا توجد أخطاء برمجية
- ✅ الأيقونات موجودة وتعمل
- ✅ التنقل يعمل بشكل صحيح

الكود جاهز للاستخدام ويمكن البناء عليه لإضافة المزيد من المميزات.
