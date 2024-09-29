import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_constents/app_colors.dart';
import '../main.dart';

/// A utility class for displaying toast messages.
///
/// This class provides methods to show and remove toast notifications
/// in the app, using the [FToast] library for better customization.
class ToastUtils {
  static late FToast fToast; // Instance of FToast for showing toasts.

  // Private constructor to prevent instantiation.
  ToastUtils._internal();

  // Singleton instance of ToastUtils.
  static final ToastUtils instance = ToastUtils._internal();

  // Factory constructor to initialize FToast.
  factory ToastUtils() {
    fToast = FToast();
    fToast.init(navigator.navigatorKey.currentContext!); // Initialize FToast with the navigator context.
    return instance;
  }

  /// Displays a toast message with the given [message].
  ///
  /// This method shows a toast notification with a specified duration,
  /// background color, and text color.
  void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: AppColors.black,
      textColor: Colors.white,
      timeInSecForIosWeb: 3,
    );
  }

  /// Removes the currently displayed custom toast.
  void removeToast() {
    fToast.removeCustomToast(); // Removes the toast from the screen.
  }
}
