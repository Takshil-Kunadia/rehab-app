import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController {
  int selectedIndex = 0;
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changePage(int index) {
    if (index != selectedIndex) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
      selectedIndex = index;
      update();
    }
  }
}