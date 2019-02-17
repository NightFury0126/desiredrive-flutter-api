import 'dart:async';

import 'package:flutter/services.dart';

class DesiredriveApiFlutter {
  static const MethodChannel _channel =
      const MethodChannel('desiredrive_api_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
