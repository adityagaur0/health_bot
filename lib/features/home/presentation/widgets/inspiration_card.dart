import 'package:flutter/material.dart';

import '../../../../core/utils/constant/colour.dart';
import '../../../../core/utils/device/device_utility.dart';

class InspirationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 480,
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(20.0),
          // margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: TColors.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80.0),
              topRight: Radius.circular(80.0),
              bottomLeft: Radius.circular(80.0),
              bottomRight: Radius.circular(80.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // _buildGrandmotherPhoto(),
              //  CircularImageWidget(),
              const SizedBox(height: 270.0),
              Text(
                'Stay Inspired!',
                style: TextStyle(
                  color: TColors.accent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                  '“Take care of your body. It’s the only place you have to live.”',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                  // style: TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 18.sp,
                  // ),

                  ),
              const SizedBox(height: 10.0),
              Text('- Jim Rohn',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
            ],
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/on_boarding_images/topography2.png', // Path to your image
            fit: BoxFit.cover,
            height: 300,
            color: Colors.black,
          ),
        ),
        Center(
          child: Image.asset(
            'assets/images/on_boarding_images/grandmother.png', // Path to your image
            fit: BoxFit.cover,
            height: 280,
          ),
        ),
      ],
    );
  }

  Widget _buildGrandmotherPhoto() {
    return Image.asset(
      'assets/images/on_boarding_images/dadi_final.png', // Path to your grandmother's photo
      width: 90, // Adjust the width as needed
      height: 90, // Adjust the height as needed
    );
  }
}
