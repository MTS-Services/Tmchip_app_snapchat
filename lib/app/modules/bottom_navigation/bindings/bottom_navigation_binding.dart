import 'package:get/get.dart';
import 'package:tmchip_app/app/modules/explore/controllers/explore_controller.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
    Get.put(ExploreController());
  }
}
