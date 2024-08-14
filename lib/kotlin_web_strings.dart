import 'string_functions_stub.dart'
if (dart.library.html) 'string_functions_web.dart'
if (dart.library.io) 'string_functions_android.dart';


abstract class StringFunctions {
  Future<String> reverseString(String text);
  Future<String> toUpperCase(String text);
  Future<String> toLowerCase(String text);
  Future<int> getLength(String text);
  Future<String> concatenate(String text1, String text2);
  Future<String> replaceAll(String text, String from, String to);
  Future<bool> contains(String text, String substring);
  Future<String> substring(String text, int start, [int? end]);
  Future<String> trim(String text);
  Future<String> trimLeft(String text);
  Future<String> trimRight(String text);

  // Factory constructor to return the correct implementation based on the platform
  factory StringFunctions() => getStringFunctionsInstance();
}

