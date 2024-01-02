import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/util/page_routes.dart';

class AppLogic {
  /// Indicates to the rest of the app that bootstrap has not completed.
  /// The router will use this to prevent redirects while bootstrapping.
  bool isBootstrapComplete = false;

  /// Initialize the app and all main actors.
  /// Loads settings, sets up services etc.
  Future<void> bootstrap() async {
    // Default error handler
    FlutterError.onError = _handleFlutterError;

    // Load any bitmaps the views might need
    //await AppBitmaps.init();

    // Default to only allowing portrait mode
    setDeviceOrientation(Axis.vertical);

    // Set preferred refresh rate to the max possible (the OS may ignore this)
    if (defaultTargetPlatform == TargetPlatform.android) {
      await FlutterDisplayMode.setHighRefreshRate();
    }



    // Flag bootStrap as complete
    isBootstrapComplete = true;

  }

  void setDeviceOrientation(Axis? axis) {
    final orientations = <DeviceOrientation>[];
    if (axis == null || axis == Axis.vertical) {
      orientations.addAll([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    if (axis == null || axis == Axis.horizontal) {
      orientations.addAll([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    SystemChrome.setPreferredOrientations(orientations);
  }

  void _handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  }

  Future<T?> showFullscreenDialogRoute<T>(BuildContext context, Widget child) async {
    return await Navigator.of(context).push<T>(
      PageRoutes.dialog<T>(child, $styles.times.pageTransition),
    );
  }
}
