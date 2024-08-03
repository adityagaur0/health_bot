import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/helpers/helper_functions.dart';
import 'package:health_bot/core/widgets/loaders/animation_loaders.dart';


// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  // This method doesn't return anything.
  /// Parameters:
  /// - text: The text to be displayed in the loading dialog.
  /// - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // stop loading animation , doesnot return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
