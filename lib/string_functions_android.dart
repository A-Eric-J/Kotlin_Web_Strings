import 'dart:async';
import 'package:flutter/services.dart';
import 'package:kotlin_web_strings/kotlin_web_strings.dart';

class StringFunctionsAndroid implements StringFunctions {
  static const platform = MethodChannel('kotlin_web_strings');

  @override
  Future<String> reverseString(String text) async {
    final String result = await platform.invokeMethod('reverseString', {'input': text});
    return result;
  }

  @override
  Future<String> toUpperCase(String text) async {
    final String result = await platform.invokeMethod('toUpperCase', {'input': text});
    return result;
  }

  @override
  Future<String> toLowerCase(String text) async {
    final String result = await platform.invokeMethod('toLowerCase', {'input': text});
    return result;
  }

  @override
  Future<int> getLength(String text) async {
    final int result = await platform.invokeMethod('getLength', {'input': text});
    return result;
  }

  @override
  Future<String> concatenate(String text1, String text2) async {
    final String result = await platform.invokeMethod('concatenate', {'input1': text1, 'input2': text2});
    return result;
  }

  @override
  Future<String> replaceAll(String text, String from, String to) async {
    final String result = await platform.invokeMethod('replaceAll', {'input': text, 'from': from, 'to': to});
    return result;
  }

  @override
  Future<bool> contains(String text, String substring) async {
    final bool result = await platform.invokeMethod('contains', {'input': text, 'substring': substring});
    return result;
  }

  @override
  Future<String> substring(String text, int start, [int? end]) async {
    final String result = await platform.invokeMethod('substring', {'input': text, 'start': start, 'end': end});
    return result;
  }

  @override
  Future<String> trim(String text) async {
    final String result = await platform.invokeMethod('trim', {'input': text});
    return result;
  }

  @override
  Future<String> trimLeft(String text) async {
    final String result = await platform.invokeMethod('trimLeft', {'input': text});
    return result;
  }

  @override
  Future<String> trimRight(String text) async {
    final String result = await platform.invokeMethod('trimRight', {'input': text});
    return result;
  }
}
StringFunctions getStringFunctionsInstance() => StringFunctionsAndroid();

