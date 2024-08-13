package com.amiirrallii.kotlin_web_strings

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "com.kotlin_web_strings/string_functions"

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
      val input = call.argument<String>("input")
      when (call.method) {
        "reverseString" -> result.success(StringFunctions().reverseString(input!!))
        "toUpperCase" -> result.success(StringFunctions().toUpperCase(input!!))
        "toLowerCase" -> result.success(StringFunctions().toLowerCase(input!!))
        "capitalizeString" -> result.success(StringFunctions().capitalizeString(input!!))
        "getLength" -> result.success(StringFunctions().getLength(input!!))
        "isPalindrome" -> result.success(StringFunctions().isPalindrome(input!!))
        "countVowels" -> result.success(StringFunctions().countVowels(input!!))
        "replaceSpaces" -> {
          val replacement = call.argument<String>("replacement")
          result.success(StringFunctions().replaceSpaces(input!!, replacement!!))
        }
        "getFirstCharacter" -> result.success(StringFunctions().getFirstCharacter(input!!)?.toString())
        "getLastCharacter" -> result.success(StringFunctions().getLastCharacter(input!!)?.toString())
        "containsSubstring" -> {
          val substring = call.argument<String>("substring")
          result.success(StringFunctions().containsSubstring(input!!, substring!!))
        }
        else -> result.notImplemented()
      }
    }
  }
}
