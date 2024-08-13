import 'package:flutter_test/flutter_test.dart';
import 'package:kotlin_web_strings/kotlin_web_strings.dart';
import 'package:kotlin_web_strings/kotlin_web_strings_platform_interface.dart';
import 'package:kotlin_web_strings/kotlin_web_strings_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKotlinWebStringsPlatform
    with MockPlatformInterfaceMixin
    implements KotlinWebStringsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KotlinWebStringsPlatform initialPlatform = KotlinWebStringsPlatform.instance;

  test('$MethodChannelKotlinWebStrings is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKotlinWebStrings>());
  });

  test('getPlatformVersion', () async {
    KotlinWebStrings kotlinWebStringsPlugin = KotlinWebStrings();
    MockKotlinWebStringsPlatform fakePlatform = MockKotlinWebStringsPlatform();
    KotlinWebStringsPlatform.instance = fakePlatform;

    expect(await kotlinWebStringsPlugin.getPlatformVersion(), '42');
  });
}
