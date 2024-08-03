import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_bot/core/utils/device/device_utility.dart';
import 'package:health_bot/features/home/presentation/widgets/inspiration_card.dart';
import 'package:health_bot/features/authentication/data/controllers/user_controller.dart';
import 'package:health_bot/features/authentication/data/repo/authentication_repository.dart';
import '../widgets/bottom-navigation-bar/custom_bar.dart';
import '../widgets/custom_container.dart';
import '../widgets/heading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // String greeting = "";
    // if (now.hour >= 0 && now.hour < 12) {
    //   greeting = "Good Morning";
    // } else if (now.hour >= 12 && now.hour < 17) {
    //   greeting = "Good Afternoon";
    // } else if (now.hour >= 17 && now.hour < 21) {
    //   greeting = "Good Evening";
    // } else {
    //   greeting = "Good Night";
    // }

    final authController = AuthenticationRepository.instance;
    final controller = Get.put(UserController());
    // final userController = UserController.instance;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              //  padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),

                  // 1.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: HeadingBlock1(controller: controller),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // 2.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomContainer1(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // 3.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Our Features",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 25,
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // 4.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomContainer2(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //5. 
                  InspirationCard(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}








      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   forceMaterialTransparency: true,
      //   leading: GestureDetector(
      //     onTap: () {
      //       authController.logout();
      //       //  Get.to(() => ProfileScreen());
      //     },
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Obx(() {
      //         final networkImage = controller.user.value.profilePicture;
      //         final image = networkImage.isNotEmpty ? networkImage : kMemoji1;
      //         return controller.imageUplaoding.value
      //             ? const TShimmerEffect(
      //                 width: 40,
      //                 height: 40,
      //                 radius: 20,
      //               )
      //             : TCircularImage(
      //                 image: image,
      //                 width: 40,
      //                 height: 40,
      //                 isNetworkImage: networkImage.isNotEmpty,
      //               );
      //       }),
      //     ),
      //   ),
      //   title: Obx(
      //     () {
      //       if (controller.profileLoading.value) {
      //         return const TShimmerEffect(width: 80, height: 15);
      //       }
      //       return RichText(
      //           text: TextSpan(
      //               text: greeting + '\n',
      //               style: Theme.of(context).textTheme.headline6!.copyWith(
      //                   color: Colors.grey.shade500,
      //                   fontSize: 17.sp,
      //                   fontWeight: FontWeight.bold),
      //               // style: GoogleFonts.lato(
      //               //     fontSize: 17.sp,
      //               //     fontWeight: FontWeight.bold,
      //               //     color: Colors.grey.shade500),
      //               children: <TextSpan>[
      //             TextSpan(
      //               text: controller.user.value.fullName
      //                   .capitalize, //fetching use name here
      //               // style: GoogleFonts.lato(
      //               //     fontSize: 23.sp,
      //               //     fontWeight: FontWeight.bold,
      //               //     color: Colors.grey.shade900),
      //             ),
      //           ]));
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.notifications_active_outlined,
      //         color: Colors.black,
      //         size: 30,
      //       ),
      //       onPressed: () {
      //         //  Get.to(() => NotificationPage());
      //       },
      //     ),
      //     SizedBox(width: 10.w),
      //   ],
      //   // elevation: 0,
      //   // backgroundColor: Colors.white,
      // ),
      // appBar: AppBar(
      //   title: const Text('Home Page'),
      //   actions: [
      //     IconButton(
      //         onPressed: () => controller.logout(), icon: Icon(Icons.logout))
      //   ],
      // ),