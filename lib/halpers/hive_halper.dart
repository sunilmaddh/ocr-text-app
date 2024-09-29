import 'package:hive/hive.dart';
import 'package:ocr_app/models/data_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveHalper {

  // Static Initialization method for Hive
  static Future<void> initializeHive() async {
    try {
      var directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path);
      Hive.registerAdapter(DataModelAdapter());

      // Check if the box is already open before opening
      if (!Hive.isBoxOpen('data')) {
        await Hive.openBox<DataModel>('data');
      }
    } catch (e) {
      // Handle any errors
      print("Error initializing Hive: $e");
    }
  }
 
}

