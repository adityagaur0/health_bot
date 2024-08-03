import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_bot/features/authentication/presentation/pages/profile_setup_page.dart';
import 'package:health_bot/features/chat-bot/presentation/pages/chat_bot.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/constant/colour.dart';

class CustomContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatBot());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        constraints: BoxConstraints(minHeight: 80.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: TColors.primary, // Change this to your desired color
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white.withOpacity(0.5),
              backgroundImage: const AssetImage(
                'assets/images/memoji/image.png', // Replace with your bot image URL
              ),
            ),
            SizedBox(width: 20.w),
            const Expanded(
              child: Text(
                'Your Personal Healthcare Chat Assistant',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(width: 20.w),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                child: Lottie.asset("assets/lottie/arrow_right.json",
                    width: MediaQuery.of(context).size.width),
              ),
              // child: Icon(
              //   Icons.arrow_forward_ios,
              //   color: Color.fromARGB(255, 55, 50, 50),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallContainer(
                  onTap: () => Get.to(() => ProfileSetupPage()),
                  icon: Icons.health_and_safety_outlined,
                  text: 'Symptom checker'),
              const SizedBox(width: 3.0),
              SmallContainer(
                  icon: Icons.video_chat_outlined, text: 'Teleconsultation'),
              const SizedBox(width: 3.0),
              SmallContainer(icon: Icons.emergency, text: 'Emergency Help'),
            ],
          ),
          const SizedBox(height: 3.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallContainer(icon: Icons.macro_off, text: 'Health Monitoring'),
              const SizedBox(width: 3.0),
              SmallContainer(
                  icon: Icons.monitor_heart_outlined,
                  text: 'Medication Reminder'),
              const SizedBox(width: 3.0),
              SmallContainer(
                  icon: Icons.document_scanner_outlined,
                  text: 'Scan Your Report'),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;

  SmallContainer({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 249, 249, 249),
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30.0, color: Colors.black),
              SizedBox(height: 5.h),
              Text(text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
