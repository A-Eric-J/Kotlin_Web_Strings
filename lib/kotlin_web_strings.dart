import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:kotlin_web_strings/kotlin_web_strings_web.dart';


class StringFunctions {
  static const platform = MethodChannel('kotlin_web_strings');

  Future<String> reverseString(String text) async {
    if (kIsWeb) {
      return StringFunctionsWeb().reverseString(text);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('reverseString', {'input': text});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> toUpperCase(String text) async {
    if (kIsWeb) {
      return StringFunctionsWeb().toUpperCase(text);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('toUpperCase', {'input': text});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> toLowerCase(String text) async {
    if (kIsWeb) {
      return StringFunctionsWeb().toLowerCase(text);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('toLowerCase', {'input': text});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<int> getLength(String text) async {
    if (kIsWeb) {
      return StringFunctionsWeb().getLength(text);
    } else if (Platform.isAndroid) {
      final int result = await platform.invokeMethod('getLength', {'input': text});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> concatenate(String text1, String text2) async {
    if (kIsWeb) {
      return StringFunctionsWeb().concatenate(text1, text2);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('concatenate', {'input1': text1, 'input2': text2});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> replaceAll(String text, String from, String to) async {
    if (kIsWeb) {
      return StringFunctionsWeb().replaceAll(text, from, to);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('replaceAll', {'input': text, 'from': from, 'to': to});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<bool> contains(String text, String substring) async {
    if (kIsWeb) {
      return StringFunctionsWeb().contains(text, substring);
    } else if (Platform.isAndroid) {
      final bool result = await platform.invokeMethod('contains', {'input': text, 'substring': substring});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> substring(String text, int start, [int? end]) async {
    if (kIsWeb) {
      return StringFunctionsWeb().substring(text, start, end ?? 0);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('substring', {'input': text, 'start': start, 'end': end});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> trim(String text) async {
    if (kIsWeb) {
      return StringFunctionsWeb().trim(text);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('trim', {'input': text});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> trimLeft(String text) async {
    if (kIsWeb) {
      return StringFunctionsWeb().trimLeft(text);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('trimLeft', {'input': text});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

  Future<String> trimRight(String text) async {
    if (kIsWeb) {
      return StringFunctionsWeb().trimRight(text);
    } else if (Platform.isAndroid) {
      final String result = await platform.invokeMethod('trimRight', {'input': text});
      return result;
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }
}
