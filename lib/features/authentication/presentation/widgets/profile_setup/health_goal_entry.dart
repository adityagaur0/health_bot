// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../data/controllers/profile_setup_controller.dart';

// class HealthGoalsEntryWidget extends StatelessWidget {
//   final ProfileSetupController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController goalsController = TextEditingController();

//     return Column(
//       children: [
//         Text('Please enter your health goals:'),
//         CupertinoTextField(
//           controller: goalsController,
//           placeholder: 'Enter your health goals',
//           onChanged: (value) {
//             controller.updateHealthGoals(value);
//           },
//         ),
//         SizedBox(height: 20),
//         CupertinoButton(
//           child: Text('Next'),
//           onPressed: () {
//             if (goalsController.text.isNotEmpty) {
//               controller.updateHealthGoals(goalsController.text);
//               controller.saveToPreferences();
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
