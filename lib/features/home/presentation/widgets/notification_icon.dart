import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/features/authentication/data/repo/authentication_repository.dart';

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: const Color.fromARGB(255, 204, 204, 204),
          width: 1.0,
        ),
      ),
      child: GestureDetector(
        onTap: () => controller.logout(),
        child: const Icon(
          Icons.notifications_outlined,
          color: Colors.black,
          size: 30.0,
        ),
      ),
    );
  }
}
