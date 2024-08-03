import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/core/utils/device/device_utility.dart';

import '../../../../core/utils/constant/colour.dart';
import '../../../../core/utils/constant/image_strings.dart';
import '../../../../core/utils/constant/sizes.dart';
import '../../data/controllers/login_controller.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return GestureDetector(
      onTap: () {
        controller.googleSignIn();
      },
      child: Container(
        height: 50,
        width: TDeviceUtils.getScreenWidth(context),
        decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(TImages.google),
                width: TSizes.iconMd,
                height: TSizes.iconMd,
              ),
            ),
            Text("Log In With Google"),
          ],
        ),
      ),
    );
  }
}
