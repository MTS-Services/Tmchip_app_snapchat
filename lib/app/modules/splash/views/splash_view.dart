import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constent/app_color.dart';
import '../../../constent/asset_path.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      backgroundColor: AppColors.splashColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 100,
              child: Image.asset(AssetPath.snapchatPng, height: 300),
            ),
          ],
        ),
      ),
    );
  }
}
