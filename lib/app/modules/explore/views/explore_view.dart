import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmchip_app/app/routes/app_pages.dart';
import 'package:tmchip_app/widget/curved_edge_widget.dart';
import '../../../constent/asset_path.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (!controller.isCameraReady.value) {
  Future.microtask(() {
    Get.offNamed(Routes.SPLASH);
  });
  return const SizedBox(); // temporary empty UI before navigation
}

          return Stack(
            children: [
              Positioned.fill(
                top: 0,
                bottom: 0,
                child: CameraPreview(controller.cameraController!),
              ),
              JCurvedEdgeWidget(
                child: Container(height: 80, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.white),
                    const SizedBox(width: 15),
                    Image.asset(AssetPath.searchPng, height: 25),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        reusableImage(
                          assetPath: AssetPath.addPersionPng,
                          radius: 20,
                          imageSize: 25,
                          padding: const EdgeInsets.all(4),
                          imageColor: Colors.white,
                        ),
                        reusableImage(
                          assetPath: AssetPath.loopPng,
                          radius: 20,
                          imageSize: 25,
                          padding: const EdgeInsets.all(4),
                          imageColor: Colors.white,
                        ),
                      ],
                    ),
                    reusableImage(
                      assetPath: AssetPath.thunderPng,
                      radius: 20,
                      imageSize: 25,
                      padding: const EdgeInsets.all(4),
                      imageColor: Colors.white,
                    ),

                    reusableImage(
                      assetPath: AssetPath.musicPng,
                      radius: 25,
                      imageSize: 25,
                      padding: const EdgeInsets.only(left: 8),
                      imageColor: Colors.white,
                    ),
                    reusableImage(
                      assetPath: AssetPath.downPng,
                      radius: 20,
                      imageSize: 25,
                      padding: const EdgeInsets.all(4),
                      isDarkBlur: true,
                      imageColor: Colors.white,
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: kToolbarHeight + 10, // AppBar height + padding
                left: 0,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(AssetPath.galleryPng, height: 40),
                    SizedBox(width: 10),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30, // ichchha korle choto rakhte paro
                        backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30, // ichchha korle choto rakhte paro
                        backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
  // StoryCircle(
  //                 images: [
  //                   "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80",
  //                   "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80",
  //                   "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80",
  //                   "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80",
  //                   "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80",
  //                 ],
  //                 leftImage:
  //                     'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80',
  //               ),

  Widget reusableImage({
    required String assetPath,
    double radius = 20,
    double? imageSize,
    Color? imageColor,
    EdgeInsets padding = const EdgeInsets.all(8.0),
    bool isDarkBlur = false, // NEW
  }) {
    if (isDarkBlur) {
      return Align(
        alignment: Alignment.topRight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Icon container
            CircleAvatar(
              radius: radius,
              backgroundColor: Colors.black.withOpacity(0.1), // subtle darkness
              child: Padding(
                padding: padding,
                child: Image.asset(
                  assetPath,
                  color: imageColor,
                  height: imageSize ?? radius * 2,
                  width: imageSize ?? radius * 2,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Default (no blur)
    return Align(
      alignment: Alignment.topRight,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: padding,
          child: Image.asset(
            assetPath,
            color: imageColor,
            height: imageSize ?? radius * 2,
            width: imageSize ?? radius * 2,
          ),
        ),
      ),
    );
  }
}
