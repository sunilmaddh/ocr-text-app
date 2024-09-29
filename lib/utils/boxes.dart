import 'package:hive/hive.dart';
import 'package:ocr_app/models/data_model.dart';

/// A utility class for accessing Hive boxes.
///
/// This class provides methods to interact with specific Hive boxes
/// used for storing and retrieving [DataModel] instances.
class Boxes {
    /// Retrieves the Hive box for storing [DataModel] instances.
    static Box<DataModel> getData() => Hive.box<DataModel>("data");
}
