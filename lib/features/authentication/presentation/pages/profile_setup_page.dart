import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/device/device_utility.dart';
import 'package:health_bot/features/authentication/presentation/widgets/profile_setup/custom_pageview.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../data/controllers/profile_setup_controller.dart';
import '../widgets/profile_setup/profile_setup_button.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final RxString selectedGender = ''.obs;

    final ProfileSetupController controller = Get.put(ProfileSetupController());
    List<String> title = ["Age", "Gender", "Weight", "Height"];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => LinearPercentIndicator(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                animation: true,
                animateFromLastPercent: true,
                barRadius: const Radius.circular(100),
                width: TDeviceUtils.getScreenWidth(context),
                lineHeight: 10.0,
                percent: controller.currentPageIndex.value / 3,
                backgroundColor: Colors.grey.shade400,
                progressColor: TColors.primary,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Obx(() => Text(title[controller.currentPageIndex.value])),
            ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: [
                  //age
                  CustomPageView(
                    title: "How old are you?",
                    wgt: CupertinoPicker(
                      // offAxisFraction: 1.1, //to make it round
                      useMagnifier: true,
                      magnification: 2,
                      diameterRatio: 2,
                      itemExtent: 40,
                      onSelectedItemChanged: controller.updateAge,
                      children: List<Widget>.generate(
                          100 - 17, (index) => Text('${index + 18}')),
                    ),
                  ),
                  //gender
                  CustomPageView(
                    title: "What's your gender?",
                    wgt: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton.filled(
                          child: Text(" Male "),
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(100),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoButton.filled(
                          child: Text("Female"),
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(100),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoButton.filled(
                          child: Text("Others"),
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ],
                    ),
                  ),
                  //height
                  CustomPageView(
                    title: "How much you weigh? You can change this later.",
                    wgt: WeightSlider(),
                  ),
                  //weight
                  CustomPageView(
                    title: "What's your height?.",
                    wgt: HeightSlider(),
                  ),
                ],
              ),
            ),
            ProfileSetupButton(),

            // Row(
            //   children: [
            //     HoverButton(text: "Previous", onPressed: () {}),
            //     HoverButton(text: "Next", onPressed: () {})
            //   ],
            // ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      // body: Stack(
      //   children: [
      //     chatProfile(messages: controller.messages),
      //     Positioned(
      //       bottom: 20,
      //       left: 0,
      //       right: 0,
      //       child: BottomTextField(
      //         textEditingController: textEditingController,
      //         onSend: (message) {
      //           controller.handleMessage(message);
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class WeightSlider extends StatefulWidget {
  @override
  _WeightSliderState createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  double _currentWeight = 70.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Text(
          '${_currentWeight.toStringAsFixed(1)} kg',
          style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Slider(
            value: _currentWeight,
            min: 0,
            max: 200,
            divisions: 2000,
            onChanged: (value) {
              setState(() {
                _currentWeight = value;
              });
            },
            activeColor: TColors.primary,
            inactiveColor: Colors.grey.shade400,
            thumbColor: TColors.primary,
            label: _currentWeight.toStringAsFixed(1),
          ),
        ),
      ],
    );
  }
}

class HeightSlider extends StatefulWidget {
  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  double _currentHeightFeet = 5.5;

  String _heightInFeetInches(double height) {
    int feet = height.floor();
    int inches = ((height - feet) * 12).round();
    return '$feet\' $inches"';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Text(
          _heightInFeetInches(_currentHeightFeet),
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Slider(
            value: _currentHeightFeet,
            min: 1.0,
            max: 8.0,
            divisions: ((8.0 - 1.0) * 12).toInt(),
            onChanged: (value) {
              setState(() {
                _currentHeightFeet = value;
              });
            },
            activeColor: TColors.primary,
            inactiveColor: Colors.grey.shade400,
            thumbColor: TColors.primary,
            label: _heightInFeetInches(_currentHeightFeet),
          ),
        ),
      ],
    );
  }
}

// class chatProfile extends StatelessWidget {
//   const chatProfile({
//     super.key,
//     required this.messages,
//   });

//   final List<ChatMessageModel> messages;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(bottom: 90),
//         child: Obx(
//           () => ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 bool isUserMessage = messages[index].role == "user";
//                 return MessageBox(
//                   isUserMessage: isUserMessage,
//                   message: messages[index].parts.first.text,
//                 );
//               }),
//         ));
//   }
// }

// class BottomTextField extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final Function(String) onSend;

//   const BottomTextField({
//     super.key,
//     required this.textEditingController,
//     required this.onSend,
//   });

//   @override
//   _BottomTextFieldState createState() => _BottomTextFieldState();
// }

// class _BottomTextFieldState extends State<BottomTextField> {
//   bool _isFocused = false;
//   FocusNode _focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() {
//       setState(() {
//         _isFocused = _focusNode.hasFocus;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Row(
//         children: [
//           if (_isFocused)
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () {
//                 _focusNode.unfocus();
//               },
//             ),
//           if (!_isFocused) ...[
//             IconButton(
//               icon: const Icon(Icons.camera_alt_outlined),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: const Icon(Icons.wallpaper),
//               onPressed: () {},
//             ),
//           ],
//           Expanded(
//             child: TextFormField(
//               focusNode: _focusNode,
//               controller: widget.textEditingController,
//               style: const TextStyle(color: Colors.black),
//               cursorColor: Theme.of(context).primaryColor,
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide.none,
//                 ),
//                 fillColor: Colors.white,
//                 hintText: "Message",
//                 hintStyle: TextStyle(color: Colors.grey.shade400),
//                 filled: true,
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: BorderSide(color: Theme.of(context).primaryColor),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           IconButton(
//             icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
//             onPressed: () {
//               if (widget.textEditingController.text.isNotEmpty) {
//                 String text = widget.textEditingController.text;
//                 widget.textEditingController.clear();
//                 widget.onSend(text);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// //   @override
// //   Widget build(BuildContext context) {
// //     final ProfileSetupController controller = Get.put(ProfileSetupController());
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Obx(() {
// //               if (controller.age.value == 0) {
// //                 return AgeEntryWidget();
// //               } else if (controller.gender.value.isEmpty) {
// //                 return GenderEntryWidget();
// //               } else if (controller.height.value == 0.0) {
// //                 return HeightEntryWidget();
// //               } else if (controller.weight.value == 0.0) {
// //                 return WeightEntryWidget();
// //               } else if (controller.healthGoals.value.isEmpty) {
// //                 return HealthGoalsEntryWidget();
// //               } else {
// //                 return SummaryWidget();
// //               }
// //             })
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
