import 'package:ocr_app/models/data_model.dart';
import 'package:ocr_app/utils/boxes.dart';

class LocalStorageService {
  LocalStorageService._internal();

  static final LocalStorageService instance = LocalStorageService._internal();

  factory LocalStorageService() {
    return instance;
  }

  /// Saves the provided [dataModel] to local storage.
  /// This method adds the [dataModel] to the local storage box and
  /// saves it. It returns `true` if the data was saved successfully.
  static Future<bool> saveData(DataModel dataModel) async {
    final box = Boxes.getData(); 
    box.add(dataModel); 
    dataModel.save(); 
    
    return true; 
  }
}
