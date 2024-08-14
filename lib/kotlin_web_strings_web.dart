import 'dart:js' as js;
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class StringFunctionsWeb {
  /// Register the web implementation with the plugin registrar
  static void registerWith(Registrar registrar) {
    /// Initialize the JavaScript functions
    StringFunctionsWeb();
  }

  StringFunctionsWeb() {
    /// Inject the JavaScript code when the class is instantiated
    _injectJavaScript();
  }

  /// Injects JavaScript code into the global context
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

  Future<String> reverseString(String text) async {
    return _callJsFunction('reverseString', [text]);
  }

  Future<String> toUpperCase(String text) async {
    return _callJsFunction('toUpperCase', [text]);
  }

  Future<String> toLowerCase(String text) async {
    return _callJsFunction('toLowerCase', [text]);
  }

  Future<int> getLength(String text) async {
    return _callJsFunction('getLength', [text]);
  }

  Future<String> concatenate(String text1, String text2) async {
    return _callJsFunction('concatenate', [text1, text2]);
  }

  Future<String> replaceAll(String text, String from, String to) async {
    return _callJsFunction('replaceAll', [text, from, to]);
  }

  Future<bool> contains(String text, String substring) async {
    return _callJsFunction('contains', [text, substring]);
  }

  Future<String> substring(String text, int start, int end) async {
    return _callJsFunction('substring', [text, start, end]);
  }

  Future<String> trim(String text) async {
    return _callJsFunction('trim', [text]);
  }

  Future<String> trimLeft(String text) async {
    return _callJsFunction('trimLeft', [text]);
  }

  Future<String> trimRight(String text) async {
    return _callJsFunction('trimRight', [text]);
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
}
