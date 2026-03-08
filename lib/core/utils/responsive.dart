import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  
  Responsive(this.context);
  
  double get width => MediaQuery.of(context).size.width;
  

  double get height => MediaQuery.of(context).size.height;
  

  double wp(double percentage) => width * percentage / 100;
  

  double hp(double percentage) => height * percentage / 100;
  
  double sp(double size) => size * (width / 375); 
  
 
  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 900;
  bool get isDesktop => width >= 900;
  

  EdgeInsets get safePadding => MediaQuery.of(context).padding;
  

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


extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(this);
}
