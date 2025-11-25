import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constent/asset_path.dart';
import '../controllers/explore_controller.dart';
import '../../../../widget/story_circle.dart';

class ExploreView extends GetView<ExploreController> {
  ExploreView({super.key});
  final ExploreController controller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      backgroundColor: Colors.black,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 0,
      leadingWidth: 120,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 12),
          const CircleAvatar(backgroundColor: Colors.white),
          const SizedBox(width: 15),
          Image.asset(AssetPath.searchPng, height: 30),
        ],
      ),
      actions: [
        Image.asset(AssetPath.addPersionPng, height: 30),
        const SizedBox(width: 15),
        Image.asset(AssetPath.loopPng, height: 30),
      ],
    ),
      body: Obx(() {
        if (!controller.isCameraReady.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [

            Positioned.fill(
              top: 0,
              bottom: 0,
              child: CameraPreview(controller.cameraController!),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    reusableImage(
                      assetPath: AssetPath.thunderPng,
                      radius: 20,
                      imageSize: 30,
                      padding: const EdgeInsets.all(4),
                    ),

                    reusableImage(
                      assetPath: AssetPath.musicPng,
                      radius: 30,
                      imageSize: 30,
                      padding: const EdgeInsets.only(left: 8),
                    ),
                    const SizedBox(height: 10),
                    reusableImage(
                      assetPath: AssetPath.downPng,
                      radius: 20,
                      imageSize: 30,
                      backgroundColor: Colors.grey.shade600,
                      padding: const EdgeInsets.all(4),
                    ),
                  ],
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                top: kToolbarHeight + 10, // AppBar height + padding
                left: 0,
                right: 0,
                child: StoryCircle(
                  images: [
                    "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80",
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80",
                    "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80",
                    "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80",
                    "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80",
                  ], leftImage: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80',
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  /// 🔥 Reusable Image Widget
  Widget reusableImage({
    required String assetPath,
    double radius = 20,
    double? imageSize,
    Color? backgroundColor,
    Color? imageColor,
    EdgeInsets padding = const EdgeInsets.all(8.0),
  }) {
    return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.transparent,
        child: Padding(
          padding: padding,
          child: ClipOval(
            child: Image.asset(
              assetPath,
              color: imageColor,
              width: imageSize ?? radius * 2,
              height: imageSize ?? radius * 2,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
