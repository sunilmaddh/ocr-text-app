import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ocr_app/models/data_model.dart';
import 'package:ocr_app/utils/boxes.dart';

class ImageProcessingController extends GetxController{
  RxString selectedImage="".obs;
  RxBool isScanning=false.obs;
  RxBool isBox=false.obs;
  Rx<DataModel> dataModel=DataModel().obs;

  @override
  void onInit() {
   isCheckingData();
    super.onInit();
  }

  void isCheckingData(){
   var data= Boxes.getData();
   if(data.isNotEmpty){
     isBox.value=true;
   }else{
    isBox.value=false;
   }
  }
  @override
  void onClose() {
    Hive.close();  
    super.onClose(); 
  }
  
   clearData(){
     dataModel.value=DataModel();
     selectedImage.value="";
     if(isBox.isFalse){
      isCheckingData();
     }
   }
}