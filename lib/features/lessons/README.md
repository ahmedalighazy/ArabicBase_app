# Lessons Feature

## Overview
The Lessons feature displays the educational index (الفهرس التعليمي) showing all available lessons and units with their progress.

## Structure

### Domain Layer
- `entities/lesson.dart`: Lesson entity with all required fields

### Presentation Layer
- `pages/lessons_page.dart`: Main lessons page with header and list

## Components

### LessonsPage
Main page that displays:
- Page title: "الفهرس التعليمي"
- Subtitle: "استعرض الوحدات وتابع التعلم خطوة بخطوة"
- Overall progress indicator showing total progress across all lessons
- List of lesson cards
- Bottom navigation bar

### LessonCard (Shared Widget)
Custom card component located in `lib/shared/widgets/cards/lesson_card.dart` that displays:
- Lesson title and subtitle (orange : teal colors)
- Book icon on the left
- Progress information (lessons and exercises completed/total)
- Progress bar with percentage
- "عرض الدرس" button (or "مغلق" if locked)

## Design Specifications

### Colors
- Background: `background_app.png` with 30% opacity
- Card background: White with 90% opacity
- Card border: 3px primary color (#007F6D), 20px border radius
- Title: Orange (#F28705) : Teal (#007F6D)
- Progress bar: Primary color gradient

### Typography
- Page title: Cairo Bold, 28px
- Subtitle: Cairo Regular, 16px
- Card title: Cairo Bold, 22px
- Progress text: Cairo SemiBold, 16px

### Layout
- Card margin: 20px horizontal, 10px vertical
- Card padding: 20px
- Border radius: 20px
- Progress bar height: 10px

## Navigation
- From: Onboarding page (last screen "هيا نبدأ" button)
- To: Lesson details page (when clicking "عرض الدرس" button)
- Bottom nav: Home, Lessons (current), Profile

## Demo Data
Currently displays 4 demo lessons:
1. مقدمة: حروف الهجاء العربية (20% progress, unlocked)
2. الوحدة الأولى: الحروف المتشابهة (0% progress, unlocked)
3. الوحدة الثانية: الحركات القصيرة (0% progress, locked)
4. الوحدة الثالثة: الحركات الطويلة (0% progress, locked)

## Next Steps
- Implement lesson details page
- Connect to data layer for real lesson data
- Add lesson completion logic
- Implement unlock mechanism for locked lessons
