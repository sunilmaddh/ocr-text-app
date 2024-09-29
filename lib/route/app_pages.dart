import 'package:get/get.dart';
import 'package:ocr_app/route/app_route.dart';
import 'package:ocr_app/view/home_screen.dart';
import 'package:ocr_app/view/image_screen.dart';

class AppPages{
 static  List<GetPage> pages=[
    GetPage(name: AppRoute.homeScreen, page:()=>  HomeScreen()),
        GetPage(name: AppRoute.imageScreen, page:()=>  ImageScreen())

  ];
}