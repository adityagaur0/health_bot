import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_bot/features/authentication/presentation/pages/profile_setup_page.dart';

import '../../../../core/utils/constant/image_strings.dart';
import '../../../../core/utils/helpers/network_manager.dart';
import '../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../core/utils/popups/loader.dart';
import '../repo/authentication_repository.dart';
import 'user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs; // observable to hide and showpassword.
  final localStorage = GetStorage();
  final email = TextEditingController(); //controller for email input
  final password = TextEditingController(); //controller for password input
  GlobalKey<FormState> loginformKey =
      GlobalKey<FormState>(); //form key for form validation
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // Read email and password from local storage
    String? rememberedEmail = localStorage.read('REMEMBER_ME_EMAIL');
    String? rememberedPassword = localStorage.read('REMEMBER_ME_PASSWORD');

    // Check if email is not null before assigning to email.text
    if (rememberedEmail != null) {
      email.text = rememberedEmail;
    }

    // Check if password is not null before assigning to password.text
    if (rememberedPassword != null) {
      password.text = rememberedPassword;
    }

    super.onInit();
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // 1. Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);
      print("hiiiiii..........................");

      // 2. Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      print("first..........................");

      // 3. Google Authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      print("third..........................");
      // 4 . save User record
      await userController.saveUserRecord(userCredential);
      print("fourth..........................");

      // Navigate accordingly
      if (userController.isNewUser.value) {
        // User is new, navigate to add details screen
        // Replace '/addDetails' xwith your route for adding details screen
        TFullScreenLoader.stopLoading();
        Get.to(() => ProfileSetupPage());
      } else {
        TFullScreenLoader.stopLoading();

        //write a command if Detailsa are still empty.
        AuthenticationRepository.instance.screenRedirect();
      }

      // Stop Loading...

      //6. Redirect
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
