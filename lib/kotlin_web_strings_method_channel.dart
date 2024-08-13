import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kotlin_web_strings_platform_interface.dart';

/// An implementation of [KotlinWebStringsPlatform] that uses method channels.
class MethodChannelKotlinWebStrings extends KotlinWebStringsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('kotlin_web_strings');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
