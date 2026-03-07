import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/core/theme/app_colors.dart';
import 'package:arabic_base/core/theme/app_gradients.dart';
import 'package:arabic_base/core/theme/app_text_styles.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        AppConstants.spacingLarge,
        0,
        AppConstants.spacingLarge,
        AppConstants.spacingLarge,
      ),
      height: AppConstants.bottomNavHeight,
      decoration: BoxDecoration(
        gradient: AppGradients.primaryGradientTransparent(
          AppConstants.opacityVeryHigh,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF0D9589).withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.settings_rounded,
            index: 0,
          ),
          _buildCenterNavItem(),
          _buildNavItem(
            icon: Icons.search_rounded,
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: AppConstants.bottomNavHeight,
        height: AppConstants.bottomNavHeight,
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.white,
          size: AppConstants.iconSizeMedium,
        ),
      ),
    );
  }

  Widget _buildCenterNavItem() {
    return GestureDetector(
      onTap: () => onTap(1),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 124,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: AppConstants.opacityAlmostFull),
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu_book_rounded,
              color: AppColors.primary,
              size: AppConstants.iconSizeMedium,
            ),
            SizedBox(width: AppConstants.spacingSmall),
            Text(
              'الفهرس',
              style: AppTextStyles.buttonLarge.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
