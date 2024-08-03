import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/core/utils/device/device_utility.dart';

import '../../../../../core/utils/constant/sizes.dart';
import '../../../../../core/utils/constant/text_strings.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../data/controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginformKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///
            ///  Email
            Container(
              height: 50,
              width: TDeviceUtils.getScreenWidth(context),
              child: TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: TTexts.email,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///
            /// Password
            Obx(
              // obs which going to observe the value and redraw the value if needed.
              () => Container(
                height: 50,
                width: TDeviceUtils.getScreenWidth(context),
                child: TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  expands: false,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    prefixIcon: const Icon(Icons.fingerprint),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword
                              .value, // toggling the value again and again
                      icon: Icon(controller.hidePassword.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),

            ///
            ///
            /// Forget password and remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          }),
                    ),
                    const Text(TTexts.rememberMe,
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    //  Get.to(() => ForgetPasswordScreen());
                    // ForgetPasswordScreen.buildShowBottomModalSheet(context);
                  },
                  child: const Text(TTexts.forgetPassword,
                      style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields / 2,
            ),
            SizedBox(
              height: 50,
              width: TDeviceUtils.getScreenWidth(context),
              // width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, // => controller.emailAndPasswordSignIn(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton(
            //     onPressed: () {
            //       //  Get.to(() => SignUp());
            //     },
            //     child: const Text(TTexts.createAccount),
            //   ),
            // ),
            // const SizedBox(
            //   height: TSizes.spaceBtwInputFields,
            // ),
          ],
        ),
      ),
    );
  }
}
