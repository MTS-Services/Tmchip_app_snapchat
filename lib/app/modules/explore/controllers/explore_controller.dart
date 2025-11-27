import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:tmchip_app/app/routes/app_pages.dart';

class ExploreController extends GetxController {
  CameraController? cameraController;
  RxBool isCameraReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      cameraController = CameraController(
        firstCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();

      isCameraReady.value = true;

      // Navigate back to Explore screen when camera is ready
      Future.microtask(() {
        Get.offNamed(Routes.EXPLORE);
      });

    } catch (e) {
      print("Camera Error: $e");
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
