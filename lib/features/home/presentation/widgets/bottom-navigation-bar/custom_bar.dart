import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:health_bot/features/Home/presentation/pages/home_page.dart';

import '../../../../../core/utils/constant/colour.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  // void onItemTapped(int index) {
  //   setState(() {
  //     currentIndex = index;
  //     HapticFeedback.lightImpact();
  //   });
  // }
  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      HapticFeedback.lightImpact();
    });

    // // Navigate to the corresponding page
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (_) => _pages[index],
    //   ),
    // );
  }

  final List<Widget> _pages = [
    HomePage(),
    InsightsPage(),
    SyncPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 100,
            offset: Offset(0, 30),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => onItemTapped(index),
          behavior: HitTestBehavior.translucent,
          child: NavigationItem(
            index: index,
            currentIndex: currentIndex,
            displayWidth: displayWidth,
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final double displayWidth;

  static const List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.medical_information_outlined,
    Icons.link_rounded,
    Icons.settings
  ];

  static const List<String> listOfStrings = [
    'Home',
    'Insights',
    'Sync',
    'Settings',
  ];

  NavigationItem({
    required this.index,
    required this.currentIndex,
    required this.displayWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          width:
              index == currentIndex ? displayWidth * .32 : displayWidth * .18,
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: index == currentIndex ? displayWidth * .12 : 0,
            width: index == currentIndex ? displayWidth * .32 : 0,
            decoration: BoxDecoration(
              color:
                  index == currentIndex ? Colors.black12 : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          width:
              index == currentIndex ? displayWidth * .31 : displayWidth * .18,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex ? displayWidth * .13 : 0,
                  ),
                  AnimatedOpacity(
                    opacity: index == currentIndex ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Text(
                      index == currentIndex ? '${listOfStrings[index]}' : '',
                      style: TextStyle(
                        color: TColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex ? displayWidth * .03 : 20,
                  ),
                  Icon(
                    listOfIcons[index],
                    size: displayWidth * .076,
                    color: index == currentIndex
                        ? TColors.primary
                        : Colors.black26,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InsightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text('Insights Page'),
          ),
          CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}

class SyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sync'),
      ),
      body: Center(
        child: Text('Sync Page'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
