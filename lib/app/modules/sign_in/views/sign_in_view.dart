import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchip_app/app/constent/app_color.dart';
import 'package:tmchip_app/app/constent/asset_path.dart';
import '../../../../widget/app_button.dart';
import '../../../../widget/custom_text_field.dart';
import '../../bottom_navigation/views/bottom_navigation_view.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({super.key});

  final SignInController controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Get.back(),
              ),

              const SizedBox(height: 40),

              const Center(
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 40),

              CustomTextField(
                label: "USERNAME OR EMAIL",
                controller: controller.emailController,
                obscureText: false,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                label: "PASSWORD",
                controller: controller.passwordController,
                obscureText: true,
              ),
              SizedBox(height: 50),
                AppButton(
                  title: "Log In",
                  onPressed: () {
                  Get.offAll(() =>  BottomNavigationView());
                },
                  isLoading: controller.isLoginLoading.value,
                  backgroundColor: AppColors.primary,
                ),

              SizedBox(height: 15),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1.2, color: AppColors.primary),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR"),
                  ),
                  Expanded(
                    child: Divider(thickness: 1.2, color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Obx(() {
                return AppButton(
                  title: "Continue with Google",
                  onPressed: controller.loginWithGoogle,
                  isLoading: controller.isGoogleLoading.value,
                  backgroundColor: AppColors.accent,
                  icon: Image.asset(AssetPath.googlePng, height: 30, width: 30),
                );
              }),
              SizedBox(height: 150),

              Obx(
                () => buildCheckBox(
                  value: controller.saveLogin.value,
                  label: "Save Login Info on your device",
                  onChanged: controller.toggleSaveLogin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckBox({
    required bool value,
    required Function(bool) onChanged,
    required String label,
    Color activeColor = const Color(0xFF1A73E8),
    Color textColor = const Color(0xFF8F8F8F),
  }) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: value,
            onChanged: (v) => onChanged(v!),
            activeColor: activeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
