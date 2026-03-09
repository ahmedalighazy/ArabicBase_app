import 'package:flutter/material.dart';

class AppGradients {
  AppGradients._();
  
  // ==================== Primary Gradients ====================
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF0D9589),
      Color(0xFF15BFA0),
    ],
  );
  
  static const LinearGradient primaryGradientWithMiddle = LinearGradient(
    colors: [
      Color(0xFF0D9589),
      Color(0xFF12A68B),
      Color(0xFF15BFA0),
    ],
  );
  
  // ==================== Transparent Gradients ====================
  static LinearGradient primaryGradientTransparent(double opacity) {
    return LinearGradient(
      colors: [
        Color(0xFF0D9589).withValues(alpha: opacity),
        Color(0xFF15BFA0).withValues(alpha: opacity),
      ],
    );
  }
}
