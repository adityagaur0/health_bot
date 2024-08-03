import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/features/authentication/data/controllers/user_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../chat-bot/data/model/chat_message_model.dart';

class ProfileSetupController extends GetxController {
  static ProfileSetupController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  Rx<int> currentage = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;
  void updateAge(index) => currentage.value = index;

  void previousPage() {
    if (currentPageIndex.value == 0) {
      print("First page");
    } else {
      int page = currentPageIndex.value - 1;
      pageController.jumpToPage(page);
    }
  }

  void nextPage() {
    if (currentPageIndex.value == 3) {
      print("Last page");
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
}



//   var age = 0.obs;
//   var gender = ''.obs;
//   var height = 0.0.obs;
//   var weight = 0.0.obs;
//   var healthGoals = ''.obs;
//   RxList<ChatMessageModel> messages = <ChatMessageModel>[].obs;
//   final controller = UserController.instance;

//   ProfileSetupController() {
//     // loadFromPreferences();
//     initializeMessages();
//   }

//   void initializeMessages() async {
//     await Future.delayed(Duration(seconds: 1));
//     messages.add(ChatMessageModel(
//       role: "space_pod",
//       parts: [
//         ChatPartModel(
//             text:
//                 "Hi! ${controller.user.value.fullName.capitalize!}\nLet's set up your profile.")
//       ],
//     ));
//     askAge();
//   }

//   void askAge() async {
//     await Future.delayed(Duration(seconds: 1));
//     messages.add(ChatMessageModel(
//       role: "space_pod",
//       parts: [ChatPartModel(text: "Please enter your age.")],
//     ));
//   }

//   void askGender() {
//     messages.add(ChatMessageModel(
//       role: "space_pod",
//       parts: [
//         ChatPartModel(text: "Please select your gender: Male, Female, Other.")
//       ],
//     ));
//   }

//   void askHeight() {
//     messages.add(ChatMessageModel(
//       role: "space_pod",
//       parts: [ChatPartModel(text: "Please enter your height (in cm).")],
//     ));
//   }

//   void askWeight() {
//     messages.add(ChatMessageModel(
//       role: "space_pod",
//       parts: [ChatPartModel(text: "Please enter your weight (in kg).")],
//     ));
//   }

//   void askHealthGoals() {
//     messages.add(ChatMessageModel(
//       role: "space_pod",
//       parts: [ChatPartModel(text: "Please enter your health goals.")],
//     ));
//   }

//   void handleMessage(String message) {
//     messages.add(ChatMessageModel(
//       role: "user",
//       parts: [ChatPartModel(text: message)],
//     ));

//     if (age.value == 0) {
//       updateAge(int.tryParse(message) ?? 0);
//       askGender();
//       // showSummary();
//     } else if (gender.value.isEmpty) {
//       updateGender(message);
//       askHeight();
//     } else if (height.value == 0.0) {
//       updateHeight(double.tryParse(message) ?? 0.0);
//       askWeight();
//     } else if (weight.value == 0.0) {
//       updateWeight(double.tryParse(message) ?? 0.0);
//       askHealthGoals();
//     } else if (healthGoals.value.isEmpty) {
//       updateHealthGoals(message);
//       showSummary();
//     }
//   }

//   void showSummary() {
//     messages.add(ChatMessageModel(
//       role: "space_pod",
//       parts: [
//         ChatPartModel(
//             text:
//                 "Profile Summary:\nAge: ${age.value}\nGender: ${gender.value}\nHeight: ${height.value} cm\nWeight: ${weight.value} kg\nHealth Goals: ${healthGoals.value}"),
//         // ChatPartModel(text: "Age: ${age.value}"),
//         // ChatPartModel(text: "Gender: ${gender.value}"),
//         // ChatPartModel(text: "Height: ${height.value} cm"),
//         // ChatPartModel(text: "Weight: ${weight.value} kg"),
//         // ChatPartModel(text: "Health Goals: ${healthGoals.value}"),
//       ],
//     ));
//     // messages.add(ChatMessageModel(
//     //   role: "space_pod",
//     //   parts: [
//     //     ChatPartModel(text: "Would you like to save this information? (yes/no)")
//     //   ],
//     // ));
//   }

//   void updateAge(int value) {
//     age.value = value;
//     //saveToPreferences();
//   }

//   void updateGender(String value) {
//     gender.value = value;
//     // saveToPreferences();
//   }

//   void updateHeight(double value) {
//     height.value = value;
//     //saveToPreferences();
//   }

//   void updateWeight(double value) {
//     weight.value = value;
//     // saveToPreferences();
//   }

//   void updateHealthGoals(String value) {
//     healthGoals.value = value;
//     // saveToPreferences();
//   }

//   Future<void> saveToPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('age', age.value);
//     prefs.setString('gender', gender.value);
//     prefs.setDouble('height', height.value);
//     prefs.setDouble('weight', weight.value);
//     prefs.setString('healthGoals', healthGoals.value);
//   }

//   Future<void> loadFromPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     age.value = prefs.getInt('age') ?? 0;
//     gender.value = prefs.getString('gender') ?? '';
//     height.value = prefs.getDouble('height') ?? 0.0;
//     weight.value = prefs.getDouble('weight') ?? 0.0;
//     healthGoals.value = prefs.getString('healthGoals') ?? '';
//   }

//   Future<void> sendDataToFirebase() async {
//     // Implement Firebase saving logic here
//   }

//   Future<void> clearPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('age');
//     prefs.remove('gender');
//     prefs.remove('height');
//     prefs.remove('weight');
//     prefs.remove('healthGoals');
//   }
// }
