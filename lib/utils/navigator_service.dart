import 'package:flutter/material.dart';

/// A service for managing navigation within the app.
///
/// This class holds a [GlobalKey] for the [NavigatorState],
/// allowing for programmatic navigation and control of the app's navigation stack.
class NavigatorService {
  final navigatorKey = GlobalKey<NavigatorState>();
}
