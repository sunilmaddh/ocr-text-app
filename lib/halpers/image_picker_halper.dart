import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:ocr_app/utils/toast_utils.dart';

class ImagePickerHelper {
  // Private constructor
  ImagePickerHelper._privateConstructor();

  // Singleton instance
  static final ImagePickerHelper instance =
      ImagePickerHelper._privateConstructor();

  // Public factory method to provide access to the instance
  factory ImagePickerHelper() {
    return instance;
  }

  // Class variables
  File? _image;
  String imagePath = "";
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      imagePath = _image!.path;
    } else {
      ToastUtils.instance.showToast(message: "Image not selected");
    }
    return _image;
  }

  // Function to capture an image from the camera
  Future<File?> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      imagePath = _image!.path;
    } else {
      ToastUtils.instance.showToast(message: "Image not captured");
    }
    return _image;
  }
}
