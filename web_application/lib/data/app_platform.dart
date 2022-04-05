import 'dart:io';

import 'package:flutter/foundation.dart';

class AppPlatform {
  static String _getPlatform() {
    if (kIsWeb) {
      return 'Web';
    }
    return Platform.operatingSystem.isEmpty
        ? 'Undefined'
        : Platform.operatingSystem;
  }

  static String get platform => _getPlatform();
}
