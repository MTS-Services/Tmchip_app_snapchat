import 'package:get/get.dart';
import 'package:tmchip_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.SIGN_IN);
    });
  }

  void onGoogleTap() {
    Get.snackbar('Info', 'Google button tapped',
        snackPosition: SnackPosition.BOTTOM);
  }

  void onSignUpTap() {
    Get.snackbar('Info', 'Sign Up button tapped',
        snackPosition: SnackPosition.BOTTOM);
  }

  void onLoginTap() {
    Get.snackbar('Info', 'Log In tapped',
        snackPosition: SnackPosition.BOTTOM);
  }
}
