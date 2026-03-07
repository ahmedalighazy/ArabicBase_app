import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  
  Responsive(this.context);
  
  // الحصول على عرض الشاشة
  double get width => MediaQuery.of(context).size.width;
  
  // الحصول على ارتفاع الشاشة
  double get height => MediaQuery.of(context).size.height;
  
  // حساب النسبة المئوية من العرض
  double wp(double percentage) => width * percentage / 100;
  
  // حساب النسبة المئوية من الارتفاع
  double hp(double percentage) => height * percentage / 100;
  
  // حساب حجم الخط بناءً على عرض الشاشة
  double sp(double size) => size * (width / 375); // 375 هو عرض iPhone X كمرجع
  
  // التحقق من نوع الجهاز
  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 900;
  bool get isDesktop => width >= 900;
  
  // الحصول على padding آمن
  EdgeInsets get safePadding => MediaQuery.of(context).padding;
  
  // حساب responsive padding
  EdgeInsets responsivePadding({
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: left != null ? wp(left) : (horizontal != null ? wp(horizontal) : (all != null ? wp(all) : 0)),
      right: right != null ? wp(right) : (horizontal != null ? wp(horizontal) : (all != null ? wp(all) : 0)),
      top: top != null ? hp(top) : (vertical != null ? hp(vertical) : (all != null ? hp(all) : 0)),
      bottom: bottom != null ? hp(bottom) : (vertical != null ? hp(vertical) : (all != null ? hp(all) : 0)),
    );
  }
}

// Extension للوصول السريع
extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);
}
