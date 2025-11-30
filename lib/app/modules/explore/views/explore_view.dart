import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tmchip_app/widget/curved_edge_widget.dart';
import '../../../../widget/bottom_appbar_item.dart';
import '../../../constent/asset_path.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Background color
        statusBarIconBrightness: Brightness.light, // Android → White icons
        statusBarBrightness: Brightness.dark, // iOS → White icons
      ),
      child: Scaffold(
        body: SafeArea(
          child: Obx(() {
            return Stack(
              children: [
                // 👇 Only show CameraPreview when it's ready
                if (controller.isCameraReady.value &&
                    controller.cameraController != null)
                  Positioned.fill(
                    top: 0,
                    bottom: 0,
                    child: CameraPreview(controller.cameraController!),
                  )
                else
                  // Optional: black background instead of loader
                  Positioned.fill(child: Container(color: Colors.black)),

                // Top curved bar
                JCurvedEdgeWidget(
                  child: Container(height: 80, color: Colors.black),
                ),

                // Top left avatar + search
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.pickImage(),
                        child: Obx(() {
                          return CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                controller.selectedImage.value != null
                                ? FileImage(controller.selectedImage.value!)
                                : null,
                            child: controller.selectedImage.value == null
                                ? Icon(Icons.person, color: Colors.black)
                                : null,
                          );
                        }),
                      ),
                      const SizedBox(width: 15),
                      Image.asset(AssetPath.searchPng, height: 25),
                    ],
                  ),
                ),
                // Right side icons
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

                // Bottom row with gallery + big capture + avatars
                Positioned(
                  bottom: 13,
                  left: 0,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(AssetPath.galleryPng, height: 40),
                      const SizedBox(width: 10),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 7),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(AssetPath.batmanPng),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(AssetPath.avaterPng),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 0.1, color: Colors.white)),
          ),
          child: BottomAppBar(
            height: kToolbarHeight + 15,
            padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
            color: Color.fromARGB(255, 16, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomAppBarItem(
                  icon: 'assets/icons/1.svg',
                  label: 'Map',
                  index: 0,
                  onTap: () {
                    // Add navigation logic here if needed
                  },
                ),
                BottomAppBarItem(
                  icon: 'assets/icons/2.svg',
                  label: 'Chat',
                  index: 1,
                  hasRedDot: true,
                  showText: true,
                  onTap: () {
                    // Add navigation logic here if needed
                  },
                ),
                BottomAppBarItem(
                  icon: 'assets/icons/3.svg',
                  label: 'Explore',
                  index: 2,
                  onTap: () {
                    // Add navigation logic here if needed
                  },
                ),
                BottomAppBarItem(
                  icon: 'assets/icons/4.svg',
                  label: 'Stories',
                  index: 3,
                  onTap: () {
                    // Add navigation logic here if needed
                  },
                ),
                BottomAppBarItem(
                  icon: 'assets/icons/5.svg',
                  label: 'Spotlight',
                  index: 4,
                  hasRedDot: true,
                  showText: false,
                  onTap: () {
                    // Add navigation logic here if needed
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reusableImage({
    required String assetPath,
    double radius = 20,
    double? imageSize,
    Color? imageColor,
    EdgeInsets padding = const EdgeInsets.all(8.0),
    bool isDarkBlur = false,
  }) {
    if (isDarkBlur) {
      return Align(
        alignment: Alignment.topRight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: radius,
              backgroundColor: Colors.black.withOpacity(0.1),
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
