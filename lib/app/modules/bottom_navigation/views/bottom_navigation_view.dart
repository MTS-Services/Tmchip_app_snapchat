import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constent/app_color.dart';
import '../../../constent/asset_path.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends StatelessWidget {
  BottomNavigationView({super.key});

  final BottomNavigationController controller =
  Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(
        index: controller.currentIndex.value,
        children: controller.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTab,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.accent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items:  [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetPath.mapPng)),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetPath.chatPng)),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetPath.explorePng)),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetPath.popelePng)),
            label: 'Stories',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AssetPath.playPng)),
            label: 'Spotlight',
          ),
        ],
      ),
    ));
  }
}

