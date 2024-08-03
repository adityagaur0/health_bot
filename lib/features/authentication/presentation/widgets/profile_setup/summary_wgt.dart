// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../data/controllers/profile_setup_controller.dart';

// class SummaryWidget extends StatelessWidget {
//   final ProfileSetupController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Profile Summary:'),
//         Obx(() {
//           return Column(
//             children: [
//               Text('Age: ${controller.age.value}'),
//               Text('Gender: ${controller.gender.value}'),
//               Text('Height: ${controller.height.value}'),
//               Text('Weight: ${controller.weight.value}'),
//               Text('Health Goals: ${controller.healthGoals.value}'),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Send data to Firebase
//                   // Clear Shared Preferences
//                   await controller.clearPreferences();
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           );
//         }),
//       ],
//     );
//   }
// }
