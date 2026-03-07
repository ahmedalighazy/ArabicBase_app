# Assets Directory - دليل الأصول

## نظرة عامة

هذا المجلد يحتوي على جميع الأصول الثابتة للتطبيق (الصور، الأصوات، الخطوط، الرسوم المتحركة).

---

## 📁 الهيكل الكامل

```
assets/
├── images/              # الصور
│   ├── splash/         # صور شاشة البداية
│   ├── onboarding/     # صور شاشات التعريف
│   ├── categories/     # صور الفئات
│   ├── icons/          # الأيقونات (PNG)
│   └── svg/            # صور SVG
│       ├── icons/      # أيقونات SVG
│       └── illustrations/  # رسوم توضيحية SVG
│
├── audio/              # الملفات الصوتية
│   ├── letters/        # أصوات الحروف (28 حرف)
│   ├── segments/       # أصوات المقاطع الصوتية
│   │   ├── lesson_1/
│   │   ├── lesson_2/
│   │   └── lesson_3/
│   └── words/          # أصوات الكلمات الكاملة
│       ├── lesson_1/
│       ├── lesson_2/
│       └── lesson_3/
│
├── fonts/              # الخطوط العربية
└── animations/         # ملفات الرسوم المتحركة (Lottie)
```

---

## 📷 Images (الصور)

### 1. Splash Screen Images
**المسار:** `assets/images/splash/`

**الملفات المطلوبة:**
- `logo.png` - شعار التطبيق (512x512 px)
- `background.png` - خلفية شاشة البداية (اختياري)

**المواصفات:**
- الصيغة: PNG مع شفافية
- الحجم الموصى به: 512x512 px للشعار
- الدقة: @2x, @3x للأجهزة المختلفة

---

### 2. Onboarding Images
**المسار:** `assets/images/onboarding/`

**الملفات المطلوبة:**
- `onboarding_1.png` - الشاشة الأولى (تعلم العربية خطوة بخطوة)
- `onboarding_2.png` - الشاشة الثانية (الاستماع للأصوات)
- `onboarding_3.png` - الشاشة الثالثة (الممارسة اليومية)

**المواصفات:**
- الصيغة: PNG
- الحجم: 1080x1920 px (نسبة 9:16)
- الأسلوب: رسوم توضيحية ملونة وجذابة للأطفال

---

### 3. Category Images
**المسار:** `assets/images/categories/`

**الملفات المطلوبة:**
- `letters.png` - أيقونة فئة الحروف
- `two_letter_words.png` - أيقونة كلمات من حرفين
- `three_letter_words.png` - أيقونة كلمات من ثلاثة حروف
- `sentences.png` - أيقونة الجمل البسيطة

**المواصفات:**
- الصيغة: PNG مع شفافية
- الحجم: 256x256 px
- الأسلوب: أيقونات بسيطة وواضحة

---

### 4. UI Icons
**المسار:** `assets/images/icons/`

**الملفات المطلوبة:**
- `play_icon.png` - أيقونة التشغيل
- `pause_icon.png` - أيقونة الإيقاف المؤقت
- `stop_icon.png` - أيقونة الإيقاف
- `volume_icon.png` - أيقونة الصوت
- `next_icon.png` - أيقونة التالي
- `previous_icon.png` - أيقونة السابق
- `check_icon.png` - أيقونة الصح
- `close_icon.png` - أيقونة الإغلاق

**المواصفات:**
- الصيغة: PNG مع شفافية
- الحجم: 128x128 px
- الألوان: متوافقة مع ثيم التطبيق

---

## 🎨 SVG Images (صور SVG)

### نظرة عامة
ملفات SVG هي صور متجهة قابلة للتحجيم بدون فقدان الجودة، مثالية للأيقونات والرسوم التوضيحية.

### 1. SVG Icons
**المسار:** `assets/images/svg/icons/`

**الملفات الموصى بها:**
```
play.svg          - أيقونة التشغيل
pause.svg         - أيقونة الإيقاف المؤقت
stop.svg          - أيقونة الإيقاف
volume.svg        - أيقونة الصوت
volume_mute.svg   - أيقونة كتم الصوت
next.svg          - أيقونة التالي
previous.svg      - أيقونة السابق
check.svg         - أيقونة الصح
close.svg         - أيقونة الإغلاق
home.svg          - أيقونة الرئيسية
settings.svg      - أيقونة الإعدادات
star.svg          - أيقونة النجمة
star_filled.svg   - أيقونة النجمة المملوءة
trophy.svg        - أيقونة الكأس
medal.svg         - أيقونة الميدالية
book.svg          - أيقونة الكتاب
headphones.svg    - أيقونة السماعات
```

**المواصفات:**
- الصيغة: SVG
- الحجم: 24x24 dp (يمكن تحجيمها لأي حجم)
- الألوان: يفضل single color للتحكم بالألوان من الكود
- التحسين: استخدام SVGO لتحسين الملفات

---

### 2. SVG Illustrations
**المسار:** `assets/images/svg/illustrations/`

**الملفات الموصى بها:**
```
onboarding_1.svg          - رسم توضيحي للشاشة الأولى
onboarding_2.svg          - رسم توضيحي للشاشة الثانية
onboarding_3.svg          - رسم توضيحي للشاشة الثالثة
empty_state.svg           - حالة فارغة
error_state.svg           - حالة خطأ
success_state.svg         - حالة نجاح
learning_illustration.svg - رسم توضيحي للتعلم
practice_illustration.svg - رسم توضيحي للممارسة
progress_illustration.svg - رسم توضيحي للتقدم
celebration.svg           - رسم توضيحي للاحتفال
```

**المواصفات:**
- الصيغة: SVG
- الحجم: responsive (يتكيف مع الشاشة)
- الألوان: ألوان كاملة ومتعددة
- الأسلوب: flat design أو illustration style
- التحسين: استخدام SVGO

---

### 3. استخدام SVG في Flutter

**إضافة الحزمة:**
```yaml
dependencies:
  flutter_svg: ^2.0.9
```

**مثال الاستخدام:**
```dart
import 'package:flutter_svg/flutter_svg.dart';

// عرض أيقونة SVG
SvgPicture.asset(
  'assets/images/svg/icons/play.svg',
  width: 24,
  height: 24,
  colorFilter: ColorFilter.mode(
    Colors.blue,
    BlendMode.srcIn,
  ),
)

// عرض رسم توضيحي SVG
SvgPicture.asset(
  'assets/images/svg/illustrations/onboarding_1.svg',
  width: 300,
  height: 300,
  fit: BoxFit.contain,
)
```

---

### 4. مصادر SVG مجانية

**أيقونات:**
- Material Icons: https://fonts.google.com/icons
- Heroicons: https://heroicons.com/
- Feather Icons: https://feathericons.com/
- Phosphor Icons: https://phosphoricons.com/
- Iconoir: https://iconoir.com/

**رسوم توضيحية:**
- unDraw: https://undraw.co/
- Storyset: https://storyset.com/
- DrawKit: https://www.drawkit.com/
- Humaaans: https://www.humaaans.com/
- Open Doodles: https://www.opendoodles.com/

---

### 5. أدوات تحسين SVG

**SVGO (أداة سطر الأوامر):**
```bash
npm install -g svgo
svgo input.svg -o output.svg
```

**SVGOMG (أداة ويب):**
https://jakearchibald.github.io/svgomg/

---

## 🔊 Audio Files (الملفات الصوتية)

### 1. Arabic Letters Audio
**المسار:** `assets/audio/letters/`

**الملفات المطلوبة (28 حرف):**
```
alef.mp3        (ا)
baa.mp3         (ب)
taa.mp3         (ت)
thaa.mp3        (ث)
jeem.mp3        (ج)
haa.mp3         (ح)
khaa.mp3        (خ)
dal.mp3         (د)
thal.mp3        (ذ)
raa.mp3         (ر)
zay.mp3         (ز)
seen.mp3        (س)
sheen.mp3       (ش)
sad.mp3         (ص)
dad.mp3         (ض)
tah.mp3         (ط)
zah.mp3         (ظ)
ain.mp3         (ع)
ghain.mp3       (غ)
faa.mp3         (ف)
qaf.mp3         (ق)
kaf.mp3         (ك)
lam.mp3         (ل)
meem.mp3        (م)
noon.mp3        (ن)
haa_end.mp3     (ه)
waw.mp3         (و)
yaa.mp3         (ي)
```

**المواصفات:**
- الصيغة: MP3
- Bitrate: 128 kbps
- Sample Rate: 44.1 kHz
- المدة: 1-2 ثانية لكل حرف
- الجودة: صوت واضح بدون ضوضاء خلفية

---

### 2. Phonetic Segments Audio
**المسار:** `assets/audio/segments/lesson_{lesson_id}/`

**اصطلاح التسمية:**
```
word_{word_id}_seg_{segment_number}.mp3
```

**أمثلة:**
```
Lesson 1:
- word_1_seg_1.mp3  (المقطع الأول من الكلمة الأولى)
- word_1_seg_2.mp3  (المقطع الثاني من الكلمة الأولى)
- word_2_seg_1.mp3  (المقطع الأول من الكلمة الثانية)

Lesson 2:
- word_10_seg_1.mp3
- word_10_seg_2.mp3
- word_10_seg_3.mp3
```

**المواصفات:**
- الصيغة: MP3
- Bitrate: 128 kbps
- Sample Rate: 44.1 kHz
- المدة: 0.5-1 ثانية لكل مقطع
- الجودة: صوت واضح مع توقف قصير بين المقاطع

---

### 3. Full Word Audio
**المسار:** `assets/audio/words/lesson_{lesson_id}/`

**اصطلاح التسمية:**
```
word_{word_id}_full.mp3
```

**أمثلة:**
```
Lesson 1:
- word_1_full.mp3   (كتب)
- word_2_full.mp3   (قلم)
- word_3_full.mp3   (باب)

Lesson 2:
- word_10_full.mp3
- word_11_full.mp3
- word_12_full.mp3
```

**المواصفات:**
- الصيغة: MP3
- Bitrate: 128 kbps
- Sample Rate: 44.1 kHz
- المدة: 1-2 ثانية لكل كلمة
- الجودة: نطق واضح وطبيعي

---

### مثال عملي كامل

**الكلمة:** كتب (word_id: 1, lesson_id: 1)

**الملفات المطلوبة:**
```
1. المقاطع الصوتية:
   assets/audio/segments/lesson_1/word_1_seg_1.mp3  (كـ)
   assets/audio/segments/lesson_1/word_1_seg_2.mp3  (تـ)
   assets/audio/segments/lesson_1/word_1_seg_3.mp3  (ب)

2. الكلمة الكاملة:
   assets/audio/words/lesson_1/word_1_full.mp3      (كتب)
```

---

## 🔤 Fonts (الخطوط)

**المسار:** `assets/fonts/`

**الخطوط الموصى بها:**

### Cairo Font (مجاني من Google Fonts)
```
Cairo-Light.ttf       (وزن 300)
Cairo-Regular.ttf     (وزن 400)
Cairo-SemiBold.ttf    (وزن 600)
Cairo-Bold.ttf        (وزن 700)
```

**رابط التحميل:**
https://fonts.google.com/specimen/Cairo

**الاستخدام:**
- `Cairo-Bold` - العناوين الرئيسية
- `Cairo-SemiBold` - العناوين الفرعية
- `Cairo-Regular` - النصوص العادية
- `Cairo-Light` - النصوص الثانوية

**المواصفات:**
- الصيغة: TTF أو OTF
- دعم كامل للحروف العربية
- دعم التشكيل (الحركات)

---

## 🎬 Animations (الرسوم المتحركة)

**المسار:** `assets/animations/`

**الملفات المطلوبة:**
- `splash_animation.json` - رسوم متحركة لشاشة البداية
- `loading_animation.json` - مؤشر التحميل
- `success_animation.json` - رسوم النجاح
- `error_animation.json` - رسوم الخطأ
- `celebration_animation.json` - رسوم الاحتفال (عند إكمال درس)

**المواصفات:**
- الصيغة: JSON (Lottie)
- المصدر: LottieFiles.com
- الحجم: أقل من 100 KB لكل ملف
- FPS: 30-60

**مصادر مجانية:**
- https://lottiefiles.com/
- https://www.lottielab.com/

---

## 📝 إضافة الأصول إلى pubspec.yaml

بعد إضافة الملفات، يجب تسجيلها في `pubspec.yaml`:

```yaml
flutter:
  assets:
    # Images
    - assets/images/splash/
    - assets/images/onboarding/
    - assets/images/categories/
    - assets/images/icons/
    
    # SVG Images
    - assets/images/svg/icons/
    - assets/images/svg/illustrations/
    
    # Audio
    - assets/audio/letters/
    - assets/audio/segments/lesson_1/
    - assets/audio/segments/lesson_2/
    - assets/audio/segments/lesson_3/
    - assets/audio/words/lesson_1/
    - assets/audio/words/lesson_2/
    - assets/audio/words/lesson_3/
    
    # Animations
    - assets/animations/
  
  fonts:
    - family: Cairo
      fonts:
        - asset: assets/fonts/Cairo-Light.ttf
          weight: 300
        - asset: assets/fonts/Cairo-Regular.ttf
          weight: 400
        - asset: assets/fonts/Cairo-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Cairo-Bold.ttf
          weight: 700
```

---

## 🎨 إرشادات التصميم

### الألوان الموصى بها
```dart
Primary Color:    #2196F3 (أزرق)
Secondary Color:  #FFC107 (أصفر/ذهبي)
Success Color:    #4CAF50 (أخضر)
Error Color:      #F44336 (أحمر)
Background:       #FFFFFF (أبيض)
Text Primary:     #212121 (رمادي غامق)
Text Secondary:   #757575 (رمادي)
```

### الأسلوب العام
- تصميم بسيط وواضح
- ألوان زاهية ومبهجة للأطفال
- رسوم توضيحية كرتونية
- أيقونات واضحة وسهلة الفهم
- خطوط كبيرة وواضحة

---

## 📊 حجم الملفات

### الحد الأقصى الموصى به:

| النوع | الحجم الأقصى |
|------|-------------|
| صورة واحدة | 500 KB |
| ملف صوتي واحد | 100 KB |
| خط واحد | 500 KB |
| رسوم متحركة | 100 KB |
| **إجمالي Assets** | **50 MB** |

---

## ✅ Checklist (قائمة التحقق)

### الصور
- [ ] logo.png (شعار التطبيق)
- [ ] onboarding_1.png
- [ ] onboarding_2.png
- [ ] onboarding_3.png
- [ ] letters.png (أيقونة الحروف)
- [ ] two_letter_words.png
- [ ] three_letter_words.png
- [ ] sentences.png

### SVG
- [ ] أيقونات SVG الأساسية (play, pause, stop, volume)
- [ ] رسوم توضيحية SVG للـ onboarding

### الأصوات
- [ ] 28 ملف صوتي للحروف
- [ ] ملفات المقاطع الصوتية للدرس 1
- [ ] ملفات الكلمات الكاملة للدرس 1
- [ ] ملفات المقاطع الصوتية للدرس 2
- [ ] ملفات الكلمات الكاملة للدرس 2

### الخطوط
- [ ] Cairo-Regular.ttf
- [ ] Cairo-Bold.ttf
- [ ] Cairo-SemiBold.ttf
- [ ] Cairo-Light.ttf

### الرسوم المتحركة
- [ ] splash_animation.json
- [ ] loading_animation.json
- [ ] success_animation.json

### التكوين
- [ ] تحديث pubspec.yaml
- [ ] اختبار تحميل الأصول
- [ ] التحقق من الأحجام

---

## 🔧 أدوات مفيدة

### ضغط الصور
- **TinyPNG**: https://tinypng.com/
- **Squoosh**: https://squoosh.app/

### ضغط الصوتيات
- **Audacity**: https://www.audacityteam.org/
- **Online Audio Converter**: https://online-audio-converter.com/

### تحرير الصور
- **Figma**: https://www.figma.com/
- **Canva**: https://www.canva.com/

### الرسوم المتحركة
- **LottieFiles**: https://lottiefiles.com/
- **Rive**: https://rive.app/

---

## 📞 ملاحظات

1. **الجودة أولاً:** استخدم ملفات عالية الجودة ثم قم بضغطها
2. **التنظيم:** حافظ على التنظيم واتبع اصطلاحات التسمية
3. **الاختبار:** اختبر جميع الأصول على أجهزة مختلفة
4. **النسخ الاحتياطي:** احتفظ بنسخة احتياطية من الملفات الأصلية
5. **الترخيص:** تأكد من حقوق استخدام جميع الأصول

---

## 🚀 الخطوات التالية

1. جمع أو إنشاء جميع الأصول المطلوبة
2. تحسين وضغط الملفات
3. تنظيم الملفات في المجلدات الصحيحة
4. تحديث pubspec.yaml
5. اختبار التطبيق على أجهزة مختلفة
6. قياس حجم التطبيق النهائي

---

**تم إنشاء هذا الدليل لمشروع ArabicBase**
**آخر تحديث: مارس 2026**
