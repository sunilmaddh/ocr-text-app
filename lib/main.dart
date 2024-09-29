import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_app/app_constents/app_colors.dart';
import 'package:ocr_app/halpers/hive_halper.dart';
import 'package:ocr_app/halpers/dependency_initializer.dart';
import 'package:ocr_app/route/app_pages.dart';
import 'package:ocr_app/route/app_route.dart';
import 'package:ocr_app/utils/service_locator.dart';

import 'utils/navigator_service.dart';

var navigator=locator<NavigatorService>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await HiveHalper.initializeHive();
  DependencyInitializer.initializeDependencies(); 
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OCR App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.black,foregroundColor: AppColors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.homeScreen,
      getPages:AppPages.pages,
    );
  }
}

