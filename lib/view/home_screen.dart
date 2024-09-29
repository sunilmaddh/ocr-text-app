import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ocr_app/app_component/data_card.dart';
import 'package:ocr_app/bottom_sheets.dart/image_picker_bottom_sheet.dart';
import 'package:ocr_app/controllers/image_processing_controller.dart';
import 'package:ocr_app/models/data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ocr_app/utils/boxes.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final _imageController=Get.find<ImageProcessingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      floatingActionButton: 
     Obx(()=> Visibility(
        visible: _imageController.isBox.isTrue,
        child: FloatingActionButton(onPressed: (){
          ImagePickerBottomSheet.showImagePickerBottomSheet(context);
        },child: Text("Scan Image",textAlign:TextAlign.center,),),
      )),
      body: ValueListenableBuilder<Box<DataModel>>(valueListenable: Boxes.getData().listenable(), builder: (context,box,_){
        if(box.isNotEmpty){
          return ListView.builder(
               itemCount: box.length,
            itemBuilder: (context,index){
              var data=box.values.toList().cast<DataModel>();
             return DataCard(name: data[index].name, email:data[index].email, mobileNumber: data[index].mobileNumber);
          });
        }else{
       return Center(
        child: ElevatedButton(onPressed: (){
          ImagePickerBottomSheet.showImagePickerBottomSheet(context);
        }, child: const Text("Scan Image")),
      );
        }
        
      })
    );
  }
}