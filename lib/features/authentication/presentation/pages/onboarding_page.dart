import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/constant/image_strings.dart';
import 'package:health_bot/core/utils/constant/text_strings.dart';
import 'package:health_bot/features/authentication/presentation/widgets/onboarding/onboarding_buttons.dart';
import 'package:health_bot/features/authentication/presentation/widgets/onboarding/onboarding_navigation.dart';
import 'package:health_bot/features/authentication/presentation/widgets/onboarding/onboarding_next_button.dart';
import 'package:health_bot/features/authentication/presentation/widgets/onboarding/onboarding_pages.dart';
import 'package:health_bot/features/authentication/presentation/widgets/onboarding/onboarding_skip.dart';

import '../../data/controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: TColors.white,
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage4,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // /// Skip button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),
          // OnboardingButtons(),

          // /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
