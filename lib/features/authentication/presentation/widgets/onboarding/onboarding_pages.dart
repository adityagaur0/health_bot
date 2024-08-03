// import 'package:flutter/material.dart';
// import 'package:health_bot/core/utils/device/device_utility.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.subTitle,
//   });
//   final String image, title, subTitle;
//   @override
//   Widget build(BuildContext context) {
//     var deviceType = getDeviceType(MediaQuery.of(context).size);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // SizedBox(
//         //   height: 50,
//         // ),
//         Image(
//           image: AssetImage(
//             image,
//           ),
//           colorBlendMode: BlendMode.softLight,
//           height: TDeviceUtils.getScreenHeight(),
//           width: TDeviceUtils.getScreenWidth(context),
//           // width: THelperFunctions.screenWidth() * 0.8,
//           // height: THelperFunctions.screenHeight() * 0.5,
//         ),
//         // Container(
//         //   width: THelperFunctions.screenWidth() *
//         //       0.8, // Set the container width to align with the image width
//         //   child: Text(
//         //     title,
//         //     style: (DeviceScreenType.mobile == deviceType)
//         //         ? Theme.of(context)
//         //             .textTheme
//         //             .headlineSmall
//         //             ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black)
//         //         : Theme.of(context).textTheme.headlineLarge?.copyWith(
//         //             fontWeight: FontWeight.w500, color: Colors.white),
//         //     textAlign: (DeviceScreenType.mobile == deviceType)
//         //         ? TextAlign.left
//         //         : TextAlign.center, // Left align the text within the container
//         //   ),
//         // ),
//         // const SizedBox(height: TSizes.spaceBtwItems),
//         // Container(
//         //   width: THelperFunctions.screenWidth() *
//         //       0.8, // Set the container width to align with the image width
//         //   child: Text(
//         //     subTitle,
//         //     style: (DeviceScreenType.mobile == deviceType)
//         //         ? Theme.of(context)
//         //             .textTheme
//         //             .bodyMedium
//         //             ?.copyWith(color: Colors.black)
//         //         : Theme.of(context)
//         //             .textTheme
//         //             .bodyLarge
//         //             ?.copyWith(color: Colors.white),
//         //     textAlign: (DeviceScreenType.mobile == deviceType)
//         //         ? TextAlign.left
//         //         : TextAlign.center, // Left align the text within the container
//         //   ),
//         // ),
//         // const SizedBox(height: TSizes.spaceBtwItems),
//       ],
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Stack(
      children: [
        // Positioned.fill(
        //   child: Image.asset(
        //     image,
        //     fit: BoxFit.cover,
        //     // colorBlendMode: BlendMode.darken,
        //   ),
        // ),
        // Positioned.fill(
        //     child: BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
        //   child: const SizedBox(),
        // )),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  title,
                  style: (DeviceScreenType.mobile == deviceType)
                      ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontFamily: 'coolvetica_regular',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )
                      : Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                  textAlign: (DeviceScreenType.mobile == deviceType)
                      ? TextAlign.left
                      : TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  subTitle,
                  style: (DeviceScreenType.mobile == deviceType)
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                          )
                      : Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                  textAlign: (DeviceScreenType.mobile == deviceType)
                      ? TextAlign.left
                      : TextAlign.center,
                ),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ],
    );
  }
}
