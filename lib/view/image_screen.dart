import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ocr_app/app_component/common_button.dart';
import 'package:ocr_app/controllers/image_processing_controller.dart';
import 'package:ocr_app/services/local_storage_service.dart';
import 'package:ocr_app/services/ocr_service.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  // Using final keyword with type annotation for clarity
  final ImageProcessingController _imageProcessingController = Get.find<ImageProcessingController>();

//  final  _textRecognizer=GoogleMlKit.vision.textRecognizer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
      ),
      body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15.0),
            child: Column(
              children: [
                // Displaying the selected image
             Obx((){
              if(_imageProcessingController.isScanning.isTrue){
                return SpinKitRotatingCircle(
                color: Colors.black,
                size: 50.0,
                );
              }else {
                // ignore: unnecessary_null_comparison
                if(_imageProcessingController.dataModel.value.name.isNotEmpty){
                 return  SizedBox(
                  width:MediaQuery.of(context).size.width,
                  child: Card(    
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                Text(_imageProcessingController.dataModel.value.name),
                                Text(_imageProcessingController.dataModel.value.email),
                                Text(_imageProcessingController.dataModel.value.mobileNumber),
                                      ],),
                    ),),
                );
                }else{
                  return SizedBox();
                }
              }
             }
              ),   
              SizedBox(height: 20,),
                Image.file(
                  File(_imageProcessingController.selectedImage.value),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitHeight, 
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CommonButton(
                      onTop: () async{
                        _imageProcessingController.isScanning.value=true;
                       _imageProcessingController.dataModel.value=await OCRService().extractTextFromImage(_imageProcessingController.selectedImage.value);
                       _imageProcessingController.isScanning.value=false;
                      }, 
                      btName: "Get Text"
                    ),
                    CommonButton(
                      onTop: () async{
                    bool isSave=  await  LocalStorageService.saveData(_imageProcessingController.dataModel.value);
                      
                    // ignore: use_build_context_synchronously
                    if(isSave){
                      _imageProcessingController.isBox.value=true;
                      _imageProcessingController.clearData();
                      OCRService().closeTextRecognize();
                     Get.back();
                    }
                   
                      }, 
                      btName: 'SAVE'
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    
  }

  @override
  void dispose() {
    _imageProcessingController.clearData();
    OCRService().closeTextRecognize();
    super.dispose();
  }
}
