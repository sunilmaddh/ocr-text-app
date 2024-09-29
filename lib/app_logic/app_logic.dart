import 'package:get/get.dart';
import 'package:ocr_app/controllers/image_processing_controller.dart';
import 'package:ocr_app/route/app_route.dart';

class AppLogic{
  AppLogic._internal();

  static final AppLogic instance=AppLogic._internal();

factory AppLogic(){
  return instance;
}
static final ImageProcessingController _imageController=Get.find<ImageProcessingController>();
  static Future<void> imageLoaded(String image) async{
  _imageController.selectedImage.value=image;
   Get.toNamed(AppRoute.imageScreen);

  }

  
}