import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';

/// خلفية التطبيق المشتركة
class AppBackground extends StatelessWidget {
  final double opacity;
  final Widget child;
  final Color? backgroundColor;
  
  const AppBackground({
    super.key,
    required this.child,
    this.opacity = 0.3,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية
        if (backgroundColor != null)
          Container(color: backgroundColor)
        else
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsConstants.backgroundApp),
                fit: BoxFit.cover,
                opacity: opacity,
              ),
            ),
          ),
        
        // المحتوى
        child,
      ],
    );
  }
}
