import 'package:flutter/material.dart';

import 'global_static.dart';

class MainPageController {
  static PageController pageController = PageController();
  static List<Function> onPageChangedCallbacks = [];

  static void navigationTab(int page) {
    pageController.jumpToPage(page);
  }

  static onPageChanged(int page) {
    GlobalStatic.mainPage.value = page;

    // for (var element in onPageChangedCallbacks) {
    //   element(page);
    // }
  }

  static addOnPageChangedCallback(Function callback) {
    onPageChangedCallbacks.add(callback);
  }
}
