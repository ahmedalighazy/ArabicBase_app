import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/constants/assets_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';

class UnitBackground extends StatelessWidget {
  const UnitBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsConstants.backgroundApp),
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
          ),
        ),
        
        Center(
          child: Opacity(
            opacity: 0.3,
            child: Icon(
              Icons.menu_book_rounded,
              size: AppConstants.iconSizeXLarge,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
