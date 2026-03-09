import 'package:flutter/material.dart';
import 'package:arabic_base/core/constants/app_constants.dart';
import 'package:arabic_base/features/lessons/domain/entities/lesson_item.dart';
import 'package:arabic_base/shared/widgets/backgrounds/unit_background.dart';
import 'package:arabic_base/shared/widgets/headers/unit_header.dart';
import 'package:arabic_base/shared/widgets/cards/lesson_item_card.dart';
import 'package:arabic_base/shared/widgets/navigation/bottom_nav_bar.dart';

class UnitPageLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final List<LessonItem> items;

  const UnitPageLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const UnitBackground(),
          
          SafeArea(
            child: Column(
              children: [
                UnitHeader(
                  title: title,
                  subtitle: subtitle,
                  progress: progress,
                ),
                
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                      bottom: AppConstants.paddingLarge,
                    ),
                    children: items.map((item) {
                      return LessonItemCard(
                        item: item,
                        onTap: () {
                          // TODO: Navigate to lesson/training content
                          print('Tapped on: ${item.title}');
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 1) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
