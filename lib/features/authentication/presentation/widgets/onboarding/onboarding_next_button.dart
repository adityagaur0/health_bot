import 'package:flutter/material.dart';
import '../../../../../core/utils/constant/colour.dart';
import '../../../../../core/utils/constant/sizes.dart';
import '../../../../../core/utils/device/device_utility.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../data/controllers/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColors.white : Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
