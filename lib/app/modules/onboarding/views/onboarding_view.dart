import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchip_app/app/modules/sign_in/views/sign_in_view.dart';
import 'package:tmchip_app/widget/app_button.dart';
import '../../../constent/app_color.dart';
import '../../../constent/asset_path.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(AssetPath.snapchatPng, height: 500)),

              SizedBox(height: 25),
              AppButton(
                title: "Continue with Google",
                onPressed: () {},
                textColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Image.asset(AssetPath.googlePng, height: 30, width: 30),
              ),
              SizedBox(height: 15),
              AppButton(
                title: "Sign Up",
                onPressed: () {},
                textColor: Colors.white,
                backgroundColor: Colors.blue,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignInView());
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
