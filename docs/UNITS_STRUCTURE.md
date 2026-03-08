# بنية الوحدات (Units Structure)

## نظرة عامة
تم إنشاء صفحة منفصلة لكل وحدة تعليمية، مع نظام تنقل نظيف ومنظم.

## الملفات المنشأة

### 1. صفحات الوحدات (Unit Pages)

#### وحدة المقدمة
**الملف:** `lib/features/lessons/presentation/pages/unit_introduction_page.dart`
- **العنوان:** مقدمة : حروف الهجاء العربية
- **التقدم:** 20%
- **المحتوى:** درس واحد + تدريب واحد

#### الوحدة الأولى: الفَتْحَة
**الملف:** `lib/features/lessons/presentation/pages/unit_fatha_page.dart`
- **العنوان:** الوحدة الأولى : الفَتْـــــــــــحَة
- **التقدم:** 0%
- **المحتوى:** درس واحد + تدريبان

#### الوحدة الثانية: الكَسْرَة
**الملف:** `lib/features/lessons/presentation/pages/unit_kasra_page.dart`
- **العنوان:** الوحدة الثانية : الكَــــــسْرَة
- **التقدم:** 0%
- **المحتوى:** درس واحد + تدريبان

#### الوحدة الثالثة: الضَّمَّة
**الملف:** `lib/features/lessons/presentation/pages/unit_damma_page.dart`
- **العنوان:** الوحدة الثالثة : الضَّــــــمَّة
- **التقدم:** 0%
- **المحتوى:** درس واحد + تدريبان

---

### 2. نظام التنقل (Navigation System)

**الملف:** `lib/core/navigation/unit_navigator.dart`

```dart
class UnitNavigator {
  static void navigateToUnit(BuildContext context, String unitId) {
    // التنقل بناءً على معرف الوحدة
  }
}
```

**الاستخدام:**
```dart
UnitNavigator.navigateToUnit(context, '1'); // المقدمة
UnitNavigator.navigateToUnit(context, '2'); // الفَتْحَة
UnitNavigator.navigateToUnit(context, '3'); // الكَسْرَة
UnitNavigator.navigateToUnit(context, '4'); // الضَّمَّة
```

---

## بنية الصفحة الموحدة

كل صفحة وحدة تحتوي على:

### 1. الخلفية (Background)
- صورة `background_app.png` بشفافية 80%
- أيقونة كتاب كبيرة في المنتصف (300px، شفافية 30%)

### 2. الـ Header
```
┌─────────────────────────────────────┐
│ [←] العنوان : العنوان الفرعي        │
│ ═══ التقدم العام XX% ═══            │
└─────────────────────────────────────┘
```

### 3. قائمة العناصر
- كارد الدروس
- كارد التدريبات

### 4. المكونات المشتركة
- `_buildHeader()`: بناء الـ header مع زر الرجوع
- `_buildProgressBar()`: بناء شريط التقدم
- `_getLessonItems()`: الحصول على عناصر الوحدة

---

## مبادئ Clean Code المطبقة

### 1. Separation of Concerns
- كل وحدة في ملف منفصل
- نظام تنقل مركزي (UnitNavigator)
- فصل المنطق عن العرض

### 2. DRY (Don't Repeat Yourself)
- استخدام نفس البنية لكل الصفحات
- استخدام الثوابت من `app_constants.dart`
- استخدام الأنماط من `app_text_styles.dart`
- استخدام الألوان من `app_colors.dart`

### 3. Single Responsibility
- `UnitNavigator`: مسؤول فقط عن التنقل
- كل صفحة وحدة: مسؤولة فقط عن عرض محتواها
- `LessonItemCard`: مسؤول فقط عن عرض الكارد

### 4. Maintainability
- سهولة إضافة وحدات جديدة
- سهولة تعديل محتوى كل وحدة
- كود واضح ومنظم

### 5. Scalability
- يمكن إضافة وحدات جديدة بسهولة
- يمكن تعديل نظام التنقل بسهولة
- يمكن إضافة مميزات جديدة لكل وحدة

---

## كيفية إضافة وحدة جديدة

### الخطوة 1: إنشاء صفحة الوحدة
```dart
// lib/features/lessons/presentation/pages/unit_new_page.dart
class UnitNewPage extends StatelessWidget {
  const UnitNewPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    // نفس البنية الموحدة
  }
}
```

### الخطوة 2: إضافة الوحدة للـ Navigator
```dart
// في lib/core/navigation/unit_navigator.dart
case '5':
  page = const UnitNewPage();
  break;
```

### الخطوة 3: إضافة الوحدة للقائمة
```dart
// في lib/features/lessons/presentation/pages/lessons_page.dart
const Lesson(
  id: '5',
  title: 'الوحدة الجديدة',
  subtitle: 'العنوان الفرعي',
  // ... باقي البيانات
)
```

---

## التنقل بين الصفحات

### من صفحة الوحدات → صفحة الوحدة
```dart
LessonCard(
  lesson: lesson,
  onTap: () => UnitNavigator.navigateToUnit(context, lesson.id),
)
```

### من صفحة الوحدة → الرجوع
```dart
IconButton(
  onPressed: () => Navigator.pop(context),
  icon: Icon(Icons.arrow_forward),
)
```

### من صفحة الوحدة → محتوى الدرس/التدريب
```dart
LessonItemCard(
  item: item,
  onTap: () {
    // TODO: Navigate to lesson/training content
  },
)
```

---

## البيانات التجريبية

### وحدة المقدمة (ID: 1)
- درس واحد (0/1)
- تدريب واحد (0/1)
- التقدم: 20%

### الوحدة الأولى: الفَتْحَة (ID: 2)
- درس واحد (0/1)
- تدريبان (0/2)
- التقدم: 0%

### الوحدة الثانية: الكَسْرَة (ID: 3)
- درس واحد (0/1)
- تدريبان (0/2)
- التقدم: 0%

### الوحدة الثالثة: الضَّمَّة (ID: 4)
- درس واحد (0/1)
- تدريبان (0/2)
- التقدم: 0%

---

## الخطوات التالية

### 1. إضافة المحتوى
- [ ] إضافة محتوى الدروس لكل وحدة
- [ ] إضافة محتوى التدريبات لكل وحدة
- [ ] تحديث البيانات التجريبية

### 2. صفحات المحتوى
- [ ] إنشاء صفحة عرض الدرس
- [ ] إنشاء صفحة عرض التدريب
- [ ] ربط الأزرار بالصفحات

### 3. Data Layer
- [ ] إنشاء Repository للوحدات
- [ ] إنشاء Data Source
- [ ] إضافة Use Cases

### 4. State Management
- [ ] إضافة Bloc/Cubit
- [ ] معالجة حالات التحميل
- [ ] تحديث التقدم ديناميكياً

---

## الاختبار

### اختبار التنقل
1. افتح التطبيق
2. انتقل لصفحة الوحدات
3. اضغط على "عرض الدروس" لأي وحدة
4. يجب أن تفتح صفحة الوحدة المناسبة
5. تحقق من العنوان والمحتوى
6. اضغط زر الرجوع
7. يجب أن ترجع لصفحة الوحدات

### التحقق من الملفات
```bash
# التحقق من عدم وجود أخطاء
flutter analyze lib/features/lessons/presentation/pages/
flutter analyze lib/core/navigation/
```

---

## الملاحظات الفنية

### RTL Support
- جميع النصوص تدعم RTL
- شريط التقدم يملأ من اليمين لليسار
- الأيقونات في المواضع الصحيحة

### Responsive Design
- استخدام `context.responsive` لجميع الأحجام
- التكيف مع أحجام الشاشات المختلفة

### Performance
- استخدام `const` constructors
- تجنب إعادة البناء غير الضرورية
- استخدام `ListView` للقوائم

---

## الخلاصة

تم إنشاء بنية نظيفة ومنظمة للوحدات:
- ✅ 4 صفحات منفصلة للوحدات
- ✅ نظام تنقل مركزي ونظيف
- ✅ كود قابل للصيانة والتوسع
- ✅ بنية موحدة لجميع الصفحات
- ✅ Clean Code principles
- ✅ لا توجد أخطاء برمجية
- ✅ جاهز لإضافة المحتوى

الآن يمكنك إضافة المحتوى الخاص بكل وحدة في ملفها المنفصل بسهولة!
