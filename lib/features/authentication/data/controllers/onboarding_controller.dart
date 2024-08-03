import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_bot/features/authentication/presentation/pages/login_page.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex =
      0.obs; // observer , change the design without using stateful.

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 3) {
      final storage = GetStorage();
      if (kDebugMode) {
        print('=======================on board==============');
        print(storage.read("IsFirstTime"));
      }
      storage.write("IsFirstTime", false);
      if (kDebugMode) {
        print('=======================on board==============');
        print(storage.read("IsFirstTime"));
      }
      Get.off(() => const LoginPage());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update Current Index & jump to the last Page
  void skipPage() {
    currentPageIndex.value = 3;
    pageController.jumpToPage(3);
  }
}
