import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_bot/core/utils/constant/colour.dart';
import 'package:health_bot/core/utils/device/device_utility.dart';
import 'package:health_bot/features/authentication/data/controllers/profile_setup_controller.dart';

class ProfileSetupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = ProfileSetupController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HoverButton(
          text: ' Previous',
          onPressed: () => controller.previousPage(),
          icon1: Icons.arrow_back_ios_new,
        ),
        HoverButton(
          text: ' Next  ',
          onPressed: () => controller.nextPage(),
          icon2: Icons.arrow_forward_ios,
        ),
      ],
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
            if (widget.icon1 != null)
              Icon(
                widget.icon1,
                size: 14,
              ),
            Text(widget.text),
            if (widget.icon2 != null)
              Icon(
                widget.icon2,
                size: 14,
              ),
          ],
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final VoidCallback onPressed;

  const GenderButton({
    required this.gender,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected ? Colors.blue : Colors.grey[300]!,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          gender,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
