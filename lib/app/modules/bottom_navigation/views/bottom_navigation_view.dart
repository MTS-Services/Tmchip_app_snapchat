import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../widget/icons_red_dot.dart';
import '../../../constent/app_color.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends StatelessWidget {
  BottomNavigationView({super.key});

  final BottomNavigationController controller = Get.put(
    BottomNavigationController(),
  );
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
        bottomNavigationBar: SizedBox(
          height: kToolbarHeight + 30,
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            selectedItemColor: Colors.grey.shade300,
            unselectedItemColor: Colors.grey.shade300,
            backgroundColor: AppColors.accent,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/1.svg',
                  color: Colors.grey.shade300,
                  height: 20,
                  width: 20,
                ),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/2.svg',
                      color: Colors.grey.shade300,
                      height: 20,
                      width: 20,
                    ),
                    IconsRedDot(showText: true),
                  ],
                ),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/3.svg',
                  color: Colors.grey.shade300,
                  height: 20,
                  width: 20,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/4.svg',
                  color: Colors.grey.shade300,
                  height: 20,
                  width: 20,
                ),
                label: 'Stories',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/5.svg',
                      color: Colors.grey.shade300,
                      height: 20,
                      width: 20,
                    ),
                    IconsRedDot(showText: false),
                  ],
                ),
                label: 'Spotlight',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
