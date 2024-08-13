// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'kotlin_web_strings_platform_interface.dart';

/// A web implementation of the KotlinWebStringsPlatform of the KotlinWebStrings plugin.
class KotlinWebStringsWeb extends KotlinWebStringsPlatform {
  /// Constructs a KotlinWebStringsWeb
  KotlinWebStringsWeb();

  static void registerWith(Registrar registrar) {
    KotlinWebStringsPlatform.instance = KotlinWebStringsWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
