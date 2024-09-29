import 'package:get_it/get_it.dart';
import 'package:ocr_app/utils/navigator_service.dart';

// Instance of GetIt for service locator
final locator = GetIt.instance;

/// Sets up the service locator by registering dependencies.
///
/// This function registers the [NavigatorService] as a singleton,
/// making it accessible throughout the app.
void setupLocator() {
  locator.registerSingleton(NavigatorService());
}
