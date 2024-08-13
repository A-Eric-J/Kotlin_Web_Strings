import 'dart:js' as js;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class StringFunctionsWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'kotlin_web_strings',
      const StandardMethodCodec(),
      registrar,
    );

    final StringFunctionsWeb instance = StringFunctionsWeb();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'reverseString':
        return reverseString(call.arguments['input']);
      case 'toUpperCase':
        return toUpperCase(call.arguments['input']);
      case 'toLowerCase':
        return toLowerCase(call.arguments['input']);
      case 'getLength':
        return getLength(call.arguments['input']);
      case 'concatenate':
        return concatenate(
          call.arguments['input1'],
          call.arguments['input2'],
        );
      case 'replaceAll':
        return replaceAll(
          call.arguments['input'],
          call.arguments['from'],
          call.arguments['to'],
        );
      case 'contains':
        return contains(
          call.arguments['input'],
          call.arguments['substring'],
        );
      case 'substring':
        return substring(
          call.arguments['input'],
          call.arguments['start'],
          call.arguments['end'],
        );
      case 'trim':
        return trim(call.arguments['input']);
      case 'trimLeft':
        return trimLeft(call.arguments['input']);
      case 'trimRight':
        return trimRight(call.arguments['input']);
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'The ${call.method} method is not implemented',
        );
    }
  }

  String reverseString(String input) {
    return js.context.callMethod('reverseString', [input]);
  }

  String toUpperCase(String input) {
    return js.context.callMethod('toUpperCase', [input]);
  }

  String toLowerCase(String input) {
    return js.context.callMethod('toLowerCase', [input]);
  }

  int getLength(String input) {
    return js.context.callMethod('getLength', [input]);
  }

  String concatenate(String input1, String input2) {
    return js.context.callMethod('concatenate', [input1, input2]);
  }

  String replaceAll(String input, String from, String to) {
    return js.context.callMethod('replaceAll', [input, from, to]);
  }

  bool contains(String input, String substring) {
    return js.context.callMethod('contains', [input, substring]);
  }

  String substring(String input, int start, [int? end]) {
    return end != null
        ? js.context.callMethod('substring', [input, start, end])
        : js.context.callMethod('substring', [input, start]);
  }

  String trim(String input) {
    return js.context.callMethod('trim', [input]);
  }

  String trimLeft(String input) {
    return js.context.callMethod('trimLeft', [input]);
  }

  String trimRight(String input) {
    return js.context.callMethod('trimRight', [input]);
  }
}
