import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'kotlin_web_strings_method_channel.dart';

abstract class KotlinWebStringsPlatform extends PlatformInterface {
  /// Constructs a KotlinWebStringsPlatform.
  KotlinWebStringsPlatform() : super(token: _token);

  static final Object _token = Object();

  static KotlinWebStringsPlatform _instance = MethodChannelKotlinWebStrings();

  /// The default instance of [KotlinWebStringsPlatform] to use.
  ///
  /// Defaults to [MethodChannelKotlinWebStrings].
  static KotlinWebStringsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KotlinWebStringsPlatform] when
  /// they register themselves.
  static set instance(KotlinWebStringsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
