// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../data/controllers/profile_setup_controller.dart';

// class WeightEntryWidget extends StatelessWidget {
//   final ProfileSetupController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('Please enter your weight (in kg):'),
//         CupertinoSlider(
//           min: 30.0,
//           max: 150.0,
//           divisions: 240,
//           value: controller.weight.value,
//           onChanged: (value) {
//             controller.updateWeight(value);
//           },
//         ),
//         Text('${controller.weight.value.toStringAsFixed(1)} kg'),
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
