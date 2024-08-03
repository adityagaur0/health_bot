// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../data/controllers/profile_setup_controller.dart';

// class GenderEntryWidget extends StatelessWidget {
//   final ProfileSetupController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Please select your gender:'),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   controller.updateGender('Male');
//                   controller.saveToPreferences();
//                 },
//                 child: Text('Male')),
//             ElevatedButton(
//                 onPressed: () {
//                   controller.updateGender('Female');
//                   controller.saveToPreferences();
//                 },
//                 child: Text('Female')),
//             ElevatedButton(
//                 onPressed: () {
//                   controller.updateGender('Other');
//                   controller.saveToPreferences();
//                 },
//                 child: Text('Other')),
//           ],
//         ),
//       ],
//     );
//   }
// }
