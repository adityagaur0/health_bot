import 'package:flutter/material.dart';
import 'package:health_bot/core/utils/device/device_utility.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    Key? key,
    this.image,
    this.title,
    this.subTitle,
    this.wgt,
  }) : super(key: key);

  final String? image, title, subTitle;
  final Widget? wgt;

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Column(
      children: [
        if (title != null) Text(title!),
        if (image != null) Image.asset(image!),
        if (wgt != null) Expanded(child: wgt!),
      ],
    );
  }
}
