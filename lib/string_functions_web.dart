import 'dart:async';
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:kotlin_web_strings/kotlin_web_strings.dart';


class StringFunctionsWeb implements StringFunctions {
  /// Register the web implementation with the plugin registrar
  static void registerWith(Registrar registrar) {
    /// Initialize the JavaScript functions
    StringFunctionsWeb();
  }

  StringFunctionsWeb() {
    _injectJavaScript();
  }

  // Injects JavaScript code into the global context
  void _injectJavaScript() {
    const jsCode = '''
      function reverseString(text) {
        return text.split("").reverse().join("");
      }

      function toUpperCase(text) {
        return text.toUpperCase();
      }

      function toLowerCase(text) {
        return text.toLowerCase();
      }

      function getLength(text) {
        return text.length;
      }

      function concatenate(text1, text2) {
        return text1 + text2;
      }

      function replaceAll(text, from, to) {
        return text.split(from).join(to);
      }

      function contains(text, substring) {
        return text.indexOf(substring) !== -1;
      }

      function substring(text, start, end) {
        return text.substring(start, end);
      }

      function trim(text) {
        return text.trim();
      }

      function trimLeft(text) {
        return text.trimStart();
      }

      function trimRight(text) {
        return text.trimEnd();
      }
    ''';
    js.context.callMethod('eval', [jsCode]);
  }

  /// Generalized method to call a JS function and return a Future
  Future<T> _callJsFunction<T>(String functionName, List args) async {
    try {
      final jsFunction = js.context[functionName];
      if (jsFunction != null) {
        return jsFunction.apply(args) as T;
      } else {
        throw Exception('$functionName function not found in JavaScript context.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in $functionName: $e');
      }
      rethrow;
    }
  }

  @override
  Future<String> reverseString(String text) async {
    return _callJsFunction('reverseString', [text]);
  }

  @override
  Future<String> toUpperCase(String text) async {
    return _callJsFunction('toUpperCase', [text]);
  }

  @override
  Future<String> toLowerCase(String text) async {
    return _callJsFunction('toLowerCase', [text]);
  }

  @override
  Future<int> getLength(String text) async {
    return _callJsFunction('getLength', [text]);
  }

  @override
  Future<String> concatenate(String text1, String text2) async {
    return _callJsFunction('concatenate', [text1, text2]);
  }

  @override
  Future<String> replaceAll(String text, String from, String to) async {
    return _callJsFunction('replaceAll', [text, from, to]);
  }

  @override
  Future<bool> contains(String text, String substring) async {
    return _callJsFunction('contains', [text, substring]);
  }

  @override
  Future<String> substring(String text, int start, [int? end]) async {
    return _callJsFunction('substring', [text, start, end]);
  }

  @override
  Future<String> trim(String text) async {
    return _callJsFunction('trim', [text]);
  }

  @override
  Future<String> trimLeft(String text) async {
    return _callJsFunction('trimLeft', [text]);
  }

  @override
  Future<String> trimRight(String text) async {
    return _callJsFunction('trimRight', [text]);
  }
}
StringFunctions getStringFunctionsInstance() => StringFunctionsWeb();

