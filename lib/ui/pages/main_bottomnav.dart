import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_getx/ui/controllers/allpostController.dart';
import 'package:task_getx/ui/pages/home/homePage.dart';
import 'package:task_getx/ui/pages/news/newsPage.dart';
import 'package:task_getx/ui/pages/notification/notificationPage.dart';
import 'package:task_getx/ui/pages/profile/profilePage.dart';

import '../../data/colorPlate.dart';
import '../controllers/main_bottom_nav_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final PageController pageController = PageController();

  final List<Widget> _screens = [
    const Homepage(),
    const Newspage(),
    const NotificationPage(),
    const Profilepage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
       Get.find<AllpostController>().getAllpost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              controller.changeScreen(index);
            },
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentSelectedIndex,
            onTap: (index) {
              controller.changeScreen(index);
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            selectedItemColor: Colors.black45,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            elevation: 4,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: ''),
            ],
          ),
        );
      },
    );
  }
}
