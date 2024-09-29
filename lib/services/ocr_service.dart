import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:ocr_app/models/data_model.dart';

class OCRService {
  OCRService._privateConstructor();
  static final OCRService _instance = OCRService._privateConstructor();
  factory OCRService() {
    return _instance;
  }

  final textRecognizer = TextRecognizer();

  /// Extracts name, mobile number, and email from the provided image.
  // Future<DataModel> extractTextFromImage(String image) async {
  //   String name = "", email = "", mobileNumber = "";
  //   final inputImage = InputImage.fromFilePath(image);
  //   final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
  //   name = await getName(recognizedText.text);
  //   mobileNumber = await getPhoneNumber(recognizedText.text);
  //   email = await getEmail(recognizedText.text);
  //   return DataModel(name: name, mobileNumber: mobileNumber, email: email);
  // }
  Future<DataModel> extractTextFromImage(String image) async {
  try {
    // Initialize input image
    final inputImage = InputImage.fromFilePath(image);

    // Process image and recognize text
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    // Extract name, mobileNumber, and email in parallel if possible
    final results = await Future.wait([
      getName(recognizedText.text),
      getPhoneNumber(recognizedText.text),
      getEmail(recognizedText.text),
    ]);

    // Assign results to respective variables
    String name = results[0];
    String mobileNumber = results[1];
    String email = results[2];
    return DataModel(name: name, mobileNumber: mobileNumber, email: email);
  } catch (e) {
    // Handle error appropriately (log it, return a default DataModel, etc.)
    print('Error extracting text: $e');
    return DataModel(name: '', mobileNumber: '', email: '');
  }
}


  /// Extracts the first valid name from the given text.
  Future<String> getName(String name) async {
    RegExp nameRegExp = RegExp(r"^[A-Za-z]+([ '-][A-Za-z]+)*$");
    String recognizedName = "";
    List<String> lines = name.split('\n');
    
    // Iterate over lines to find the first valid name
    for (String line in lines) {
      if (nameRegExp.hasMatch(line.trim())) {
        recognizedName = line.trim(); // Set extracted name if match found
        break; // Stop after finding the first valid name
      }
    }
    
    if (recognizedName.isEmpty) {
      recognizedName = "No name found";
    }
    return recognizedName;
  }

  /// Extracts a phone number from the given text.
  Future<String> getPhoneNumber(String text) async {
    final RegExp phoneRegex = RegExp(r"^\+91\s[6-9]\d{9}$");
    final RegExp phoneRegex2 = RegExp(r'\b[6-9]\d{9}\b'); 

    // Try to find a match with the first regex (with +91)
    final RegExpMatch? match1 = phoneRegex.firstMatch(text);
    
    if (match1 != null) {
      return match1.group(0) ?? 'No phone number found'; // Return match if found
    }

    // Try to find a match with the second regex (10-digit numbers)
    final RegExpMatch? match2 = phoneRegex2.firstMatch(text);
    return match2?.group(0) ?? 'No phone number found'; // Return match or fallback message
  }

  /// Extracts an email address from the given text.
  Future<String> getEmail(String text) async {
    final RegExp emailRegex = RegExp(r'\b[\w.%+-]+@[a-zA-Z.-]+\.[a-zA-Z]{2,}\b');
    final match = emailRegex.firstMatch(text);
    return match?.group(0) ?? 'No email found'; // Return match or fallback message
  }

  /// Closes the text recognizer to free up resources.
  void closeTextRecognize() {
    textRecognizer.close();
  }
}
