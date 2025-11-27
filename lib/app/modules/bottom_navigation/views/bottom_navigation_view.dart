import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constent/app_color.dart';
import '../../../constent/asset_path.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.accent,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetPath.mapPng),
                color: Colors.white,
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetPath.chatPng),
                color: Colors.white,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetPath.explorePng),
                color: Colors.white,
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetPath.popelePng),
                color: Colors.white,
              ),
              label: 'Stories',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(AssetPath.playPng),
                color: Colors.white,
              ),
              label: 'Spotlight',
            ),
          ],
        ),
      ),
    );
  }
}
