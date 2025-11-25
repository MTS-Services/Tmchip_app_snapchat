import 'package:get/get.dart';

import '../controllers/spotliath_controller.dart';

class SpotliathBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpotliathController>(
      () => SpotliathController(),
    );
  }
}
