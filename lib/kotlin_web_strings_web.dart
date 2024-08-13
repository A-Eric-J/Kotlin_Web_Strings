import 'dart:js' as js;

class StringFunctionsWeb {
  String reverseString(String input) => js.context.callMethod('reverseString', [input]);

  String toUpperCase(String input) => js.context.callMethod('toUpperCase', [input]);


  String toLowerCase(String input) => js.context.callMethod('toLowerCase', [input]);


  int getLength(String input) => js.context.callMethod('getLength', [input]);


  String concatenate(String input1, String input2) => js.context.callMethod('concatenate', [input1, input2]);


  String replaceAll(String input, String from, String to) => js.context.callMethod('replaceAll', [input, from, to]);


  bool contains(String input, String substring) => js.context.callMethod('contains', [input, substring]);

  String substring(String input, int start, [int? end])
  => end != null
        ? js.context.callMethod('substring', [input, start, end])
        : js.context.callMethod('substring', [input, start]);

  String trim(String input) => js.context.callMethod('trim', [input]);

  String trimLeft(String input) => js.context.callMethod('trimLeft', [input]);

  String trimRight(String input) => js.context.callMethod('trimRight', [input]);

}
