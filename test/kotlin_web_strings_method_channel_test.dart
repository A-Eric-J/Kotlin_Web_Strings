import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kotlin_web_strings/kotlin_web_strings_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelKotlinWebStrings platform = MethodChannelKotlinWebStrings();
  const MethodChannel channel = MethodChannel('kotlin_web_strings');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
