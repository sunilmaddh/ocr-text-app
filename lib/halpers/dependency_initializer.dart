import 'package:get/get.dart';
import 'package:ocr_app/controllers/image_processing_controller.dart';

class DependencyInitializer {
 static void initializeDependencies() {
    Get.put(ImageProcessingController());
  }
}
