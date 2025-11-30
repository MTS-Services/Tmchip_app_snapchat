import 'dart:io';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreController extends GetxController {
  CameraController? cameraController;
  RxBool isCameraReady = false.obs;
  var randomBitmoji = ''.obs;
  Rx<File?> selectedImage = Rx<File?>(null);
  
  // Key for storing the image path in shared preferences
  final String _imagePathKey = 'selected_image_path';

  @override
  void onInit() {
    super.onInit();
    initCamera();
    loadSavedImage();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      await saveImageToLocalStorage(File(image.path));
    }
  }

  Future<void> saveImageToLocalStorage(File imageFile) async {
    try {
      // Get the application documents directory
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String fileName = 'profile_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String savedImagePath = '${appDocDir.path}/$fileName';
      
      // Copy the image to app documents directory
      final File savedImage = await imageFile.copy(savedImagePath);
      
      // Update the selected image
      selectedImage.value = savedImage;
      
      // Save the path to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_imagePathKey, savedImagePath);
      
      print('Image saved to: $savedImagePath');
    } catch (e) {
      print('Error saving image: $e');
      // If saving fails, still set the original image
      selectedImage.value = imageFile;
    }
  }

  Future<void> loadSavedImage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? savedImagePath = prefs.getString(_imagePathKey);
      
      if (savedImagePath != null && savedImagePath.isNotEmpty) {
        final File imageFile = File(savedImagePath);
        
        // Check if the file exists
        if (await imageFile.exists()) {
          selectedImage.value = imageFile;
          print('Loaded saved image from: $savedImagePath');
        } else {
          // If file doesn't exist, remove the invalid path from preferences
          await prefs.remove(_imagePathKey);
          print('Saved image file not found, removed invalid path');
        }
      }
    } catch (e) {
      print('Error loading saved image: $e');
    }
  }

  // Optional: Method to clear the saved image
  Future<void> clearSavedImage() async {
    try {
      // Remove from shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_imagePathKey);
      
      // Delete the physical file if it exists
      if (selectedImage.value != null && await selectedImage.value!.exists()) {
        await selectedImage.value!.delete();
      }
      
      selectedImage.value = null;
    } catch (e) {
      print('Error clearing saved image: $e');
    }
  }

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      cameraController = CameraController(
        firstCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();
      isCameraReady.value = true;
    } catch (e) {
      print("Camera Error: $e");
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}