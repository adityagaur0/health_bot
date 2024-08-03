import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_bot/features/authentication/data/controllers/user_controller.dart';
import 'package:health_bot/features/home/presentation/pages/home_page.dart';
import 'package:health_bot/features/authentication/presentation/pages/login_page.dart';
import 'package:health_bot/features/authentication/presentation/pages/onboarding_page.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;

import '../../../../core/utils/exceptions/firebase_auth_exceptions.dart';
import '../../../../core/utils/exceptions/firebase_exceptions.dart';
import '../../../../core/utils/exceptions/format_exceptions.dart';
import '../../../../core/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //1. variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //2. Get authenticated user Data.
  User? get authUser => _auth.currentUser;
  

  //3. onready -> called from main.dart on app launch.
  @override
  void onReady() {
    screenRedirect();
  }

  void screenRedirect() {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        print("screenredirect..$authUser");
        Get.offAll(() => const HomePage());
      } else {
        Get.offAll(() => const LoginPage());
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => const LoginPage())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  /* ----------------------------------- Federated identity & social sign-in -----------------------------------*/
  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider authProvider = GoogleAuthProvider();
        final UserCredential userCredential =
            await _auth.signInWithPopup(authProvider);
        return userCredential;
      } else {
        // Trigger the authentication flow
        final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
        if (userAccount == null) {
          // User cancelled the sign-in
          return null;
        }

        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await userAccount.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the user credentials
        return await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(
          e.message ?? 'FirebaseAuthException occurred');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.message ?? 'FirebaseException occurred');
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.message ?? 'PlatformException occurred');
    } catch (e) {
      if (kDebugMode) {
        print('Something went wrong: $e');
      }
      return null;
    }
  }
  /* ----------------------------------- LogOut -----------------------------------*/
  /// [LogoutUser] - Valid for any authentication.
  ///

  Future<void> logout() async {
    try {
      // Web-specific handling
      if (kIsWeb) {
        await FirebaseAuth.instance.signOut();
        print("Logged out (web)");
      } else {
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
        print("Logged out (mobile)");
      }

      // Navigate to login page after sign-out completes
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('Something went wrong: $e');
      }
      throw 'Something went wrong. Please try again';
    }
  }
}
