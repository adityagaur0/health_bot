import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/helpers/helper_functions.dart';

import '../../../../core/utils/constant/image_strings.dart';
import '../../../../core/utils/constant/sizes.dart';
import '../../../../core/utils/constant/text_strings.dart';
import '../widgets/form_divider.dart';
import '../widgets/login/form_header_widget.dart';
import '../widgets/login/login_footer_widget.dart';
import '../widgets/login/login_form_widget.dart';
import '../widgets/social_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          padding: TSizes.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),

              /// Logo,title & subTitle
              FormHeaderWidget(
                  image: dark
                      ? TImages.onBoardingImage1
                      : TImages.onBoardingImage1,
                  title: TTexts.loginTitle,
                  subTitle: TTexts.loginSubTitle),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              //Social Buttons
              const SocialButtons(),

              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              /// Divider
              FormDivider(
                dark: dark,
                dividerText: TTexts.or.capitalize!,
              ),

              /// Form
              const LoginForm(),

              // //Social Buttons
              // const SocialButtons(),

              const Align(
                  alignment: Alignment.center, child: LoginFooterWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
