import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/features/home/presentation/widgets/notification_icon.dart';
import 'package:health_bot/features/authentication/data/controllers/user_controller.dart';

import '../../../../core/widgets/loaders/shimmer.dart';
import '../pages/home_page.dart';

class HeadingBlock1 extends StatelessWidget {
  const HeadingBlock1({
    super.key,
    required this.controller,
  });

  final UserController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () {
            if (controller.profileLoading.value) {
              return const TShimmerEffect(width: 80, height: 15);
            }
            return RichText(
                text: TextSpan(
              text: 'Hello,\n',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: const Color.fromARGB(255, 87, 87, 87),
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: controller.user.value.fullName.capitalize!,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 30,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ));
          },
        ),
        const Spacer(),
        NotificationIcon(),
      ],
    );
  }
}
