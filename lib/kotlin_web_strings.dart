
import 'kotlin_web_strings_platform_interface.dart';

class KotlinWebStrings {
  Future<String?> getPlatformVersion() {
    return KotlinWebStringsPlatform.instance.getPlatformVersion();
  }
}
