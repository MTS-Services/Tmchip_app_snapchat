import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Separate loading states
  RxBool isLoginLoading = false.obs;
  RxBool isGoogleLoading = false.obs;

  RxBool saveLogin = false.obs;

  void toggleSaveLogin(bool value) {
    saveLogin.value = value;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoginLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoginLoading.value = false;

    Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.BOTTOM);
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
