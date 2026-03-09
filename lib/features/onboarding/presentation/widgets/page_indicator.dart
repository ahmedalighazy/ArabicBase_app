import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => AnimatedContainer(
          duration: AppConstants.fastAnimationDuration,
          margin: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingXSmall,
          ),
          width: currentPage == index ? 24 : 12,
          height: 12,
          decoration: BoxDecoration(
            color: currentPage == index 
                ? AppColors.primary
                : Colors.transparent,
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
