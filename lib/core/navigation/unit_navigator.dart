import 'package:flutter/material.dart';
import 'package:arabic_base/features/lessons/presentation/pages/unit_introduction_page.dart';
import 'package:arabic_base/features/lessons/presentation/pages/unit_fatha_page.dart';
import 'package:arabic_base/features/lessons/presentation/pages/unit_kasra_page.dart';
import 'package:arabic_base/features/lessons/presentation/pages/unit_damma_page.dart';

class UnitNavigator {
  UnitNavigator._();

  static void navigateToUnit(BuildContext context, String unitId) {
    print('Navigating to unit with ID: $unitId');
    
    Widget? page;
    
    switch (unitId) {
      case '1':
        page = const UnitIntroductionPage();
        break;
      case '2':
        page = const UnitFathaPage();
        break;
      case '3':
        page = const UnitKasraPage();
        break;
      case '4':
        page = const UnitDammaPage();
        break;
      default:
        print('Unknown unit ID: $unitId');
        return;
    }
    
    print('Navigating to page: ${page.runtimeType}');
    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page!),
    );
  }
}
