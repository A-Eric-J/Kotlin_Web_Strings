
import 'kotlin_web_strings.dart';

class UnsupportedPlatformStringFunctions implements StringFunctions {
  @override
  Future<String> reverseString(String text) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> toUpperCase(String text) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> toLowerCase(String text) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<int> getLength(String text) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> concatenate(String text1, String text2) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> replaceAll(String text, String from, String to) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<bool> contains(String text, String substring) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> substring(String text, int start, [int? end]) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> trim(String text) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> trimLeft(String text) async {
    throw UnsupportedError('Platform not supported');
  }

  @override
  Future<String> trimRight(String text) async {
    throw UnsupportedError('Platform not supported');
  }
}

StringFunctions getStringFunctionsInstance() => UnsupportedPlatformStringFunctions();
