import 'package:flutter/material.dart';

import '../../../../../core/utils/constant/sizes.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // const SizedBox(
        //   height: tFormHeight - 20,
        // ),
        TextButton(
          onPressed: () {
            //    Get.off(() => const SignUpScreen());
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (cnt) => SignUpScreen()));
          },
          child: const Text.rich(
            TextSpan(
                text: "Already have an account? ",
                style: TextStyle(color: Colors.black, fontSize: 12),
                children: [
                  TextSpan(
                      text: "Sign In", style: TextStyle(color: Colors.blue)),
                ]),
          ),
        ),
      ],
    );
  }
}
