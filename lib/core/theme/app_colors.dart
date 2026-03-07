import 'package:flutter/material.dart';

/// ألوان التطبيق الأساسية
class AppColors {
  AppColors._();
  
  // الألوان الأساسية من الشعار
  static const Color primary = Color(0xFF007F6D); // اللون الأخضر (Teal)
  static const Color primaryDark = Color(0xFF005F52); // أخضر غامق
  static const Color primaryLight = Color(0xFF33998A); // أخضر فاتح
  static const Color primaryBg = Color(0xFFE6F6F4); // خلفية أخضر فاتح
  
  static const Color secondary = Color(0xFFF28705); // اللون البرتقالي
  static const Color secondaryDark = Color(0xFFD67304); // برتقالي غامق
  static const Color secondaryLight = Color(0xFFF59F38); // برتقالي فاتح
  
  // ألوان الحدود
  static const Color borderPrimary = Color(0xFF00A991); // حد أخضر
  
  // ألوان النصوص
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textWhite = Color(0xFFFFFFFF);
  
  // ألوان الخلفية
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFF121212);
  
  // ألوان الحالات
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  
  // ألوان إضافية
  static const Color divider = Color(0xFFE0E0E0);
  static const Color shadow = Color(0x1A000000);
  static const Color overlay = Color(0x80000000);
}
