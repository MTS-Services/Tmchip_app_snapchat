import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchip_app/app/constent/app_color.dart';
import 'package:tmchip_app/app/constent/asset_path.dart';
import '../../../../widget/app_button.dart';
import '../../../../widget/custom_text_field.dart';
import '../../../../widget/dual_loader.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: GestureDetector(
          onTap: Get.back,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 16,
            color: Colors.grey,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 60),
                Center(
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: "USERNAME OR EMAIL",
                  controller: controller.emailController,
                  obscureText: false,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: "PASSWORD",
                  controller: controller.passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(() {
                    final canLogin = controller.email.value.isNotEmpty &&
                        controller.password.value.isNotEmpty;

                    // When temp loader ON → force background back to primary
                    final effectiveBackground = controller.showTempLoader.value
                        ? AppColors.primary
                        : (canLogin ? Colors.blue.shade400 : AppColors.primary);

                    return AppButton(
                      title: "Log In",

                      onPressed: () {
                        if (canLogin) {
                          controller.showLoaderFor500ms();  // starts temp loader

                          // Navigate after 500ms
                          Future.delayed(Duration(milliseconds: 500), () {
                            Get.toNamed(Routes.BOTTOM_NAVIGATION);
                          });
                        }
                      },
                      icon: controller.showTempLoader.value
                          ? DualLoader(size: 18, color1: Colors.white, color2: Colors.white70)
                          : null,

                      isLoading: false,
                      backgroundColor: effectiveBackground,
                      disabledBackColor: effectiveBackground,
                    );
                  }),


                ),
                SizedBox(height: 35),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 90),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.2,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.2,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Obx(() {
                  return AppButton(
                    title: "Continue with Google",
                    onPressed: controller.loginWithGoogle,
                    isLoading: controller.isGoogleLoading.value,
                    backgroundColor: AppColors.accent,
                    icon: Image.asset(
                      AssetPath.googlePng,
                      height: 30,
                      width: 30,
                    ),
                  );
                }),
                SizedBox(height: 100),
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
      ),
    );
  }

  Widget buildCheckBox({
    required bool value,
    required Function(bool) onChanged,
    required String label,
    Color fillColor = Colors.white,
    Color checkColor = Colors.blue,
    Color textColor = Colors.black54,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            data: Theme.of(Get.context!).copyWith(
              checkboxTheme: CheckboxThemeData(
                // ✔ Tick color blue
                checkColor: MaterialStateProperty.all(checkColor),

                // ✔ Always show border even when checked
                side: MaterialStateBorderSide.resolveWith((states) {
                  return BorderSide(color: Colors.grey.shade400, width: 1.2);
                }),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),

                // ✔ White background when checked
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return fillColor;
                  }
                  return Colors.transparent;
                }),
              ),
            ),
            child: Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: value,
                onChanged: (v) => onChanged(v!),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              ),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
