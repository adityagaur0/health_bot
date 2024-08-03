import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/device/device_utility.dart';

class OnboardingButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      width: TDeviceUtils.getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HoverButton(
            text: 'Sign In',
            onPressed: () {},
          ),
          HoverButton(
            text: 'Sign Up',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon1;
  final IconData? icon2;

  HoverButton(
      {required this.text, required this.onPressed, this.icon1, this.icon2});

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          primary: isHovering ? Colors.white : TColors.primary,
          onPrimary: isHovering ? TColors.primary : Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 18.h),
          textStyle: TextStyle(fontSize: 18),
        ),
        onPressed: widget.onPressed,
        child: Row(
          children: [
            if (widget.icon1 != null) Icon(widget.icon1),
            Text(widget.text),
            if (widget.icon2 != null) Icon(widget.icon2),
          ],
        ),
      ),
    );
  }
}
