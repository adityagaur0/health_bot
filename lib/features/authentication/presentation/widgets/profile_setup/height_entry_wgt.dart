// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../data/controllers/profile_setup_controller.dart';

// class HeightEntryWidget extends StatelessWidget {
//   final ProfileSetupController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Please enter your height (in cm):'),
//         CupertinoSlider(
//           min: 100.0,
//           max: 250.0,
//           divisions: 300,
//           value: controller.height.value,
//           onChanged: (value) {
//             controller.updateHeight(value);
//           },
//         ),
//         Text('${controller.height.value.toStringAsFixed(1)} cm'),
//         SizedBox(height: 20),
//         CupertinoButton(
//           child: Text('Next'),
//           onPressed: () {
//             controller.saveToPreferences();
//           },
//         ),
//       ],
//     );
//   }
// }
