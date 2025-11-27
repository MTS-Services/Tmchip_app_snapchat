import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var email = ''.obs;
  var password = ''.obs;
  var showTempLoader = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      email.value = emailController.text;
    });

    passwordController.addListener(() {
      password.value = passwordController.text;
    });
  }

  void showLoaderFor500ms() async {
    showTempLoader.value = true;
    await Future.delayed(Duration(milliseconds: 500));
    showTempLoader.value = false;
  }

  // Separate loading states
  RxBool isLoginLoading = false.obs;
  RxBool isGoogleLoading = false.obs;

  RxBool saveLogin = false.obs;

  void toggleSaveLogin(bool value) {
    saveLogin.value = value;
  }

  Future<void> loginWithGoogle() async {
    isGoogleLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isGoogleLoading.value = false;

    Get.snackbar("Success", "Google Login Successful", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
