package com.amiirrallii.kotlin_web_strings

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

class MyFlutterPlugin : FlutterPlugin {
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "kotlin_web_strings")
    channel.setMethodCallHandler { call, result ->
      val input = call.argument<String>("input")
      when (call.method) {
        "reverseString" -> {
          val reversedString = StringFunctions().reverseString(input!!)
          result.success(reversedString)
        }
        "toUpperCase" -> {
          val upperCaseString = StringFunctions().toUpperCase(input!!)
          result.success(upperCaseString)
        }
        "toLowerCase" -> {
          val lowerCaseString = StringFunctions().toLowerCase(input!!)
          result.success(lowerCaseString)
        }
        "getLength" -> {
          val length = StringFunctions().getLength(input!!)
          result.success(length)
        }
        "concatenate" -> {
          val input2 = call.argument<String>("input2")!!
          val concatenatedString = StringFunctions().concatenate(input!!, input2)
          result.success(concatenatedString)
        }
        "replaceAll" -> {
          val from = call.argument<String>("from")!!
          val to = call.argument<String>("to")!!
          val replacedString = StringFunctions().replaceAll(input!!, from, to)
          result.success(replacedString)
        }
        "contains" -> {
          val substring = call.argument<String>("substring")!!
          val contains = StringFunctions().contains(input!!, substring)
          result.success(contains)
        }
        "substring" -> {
          val start = call.argument<Int>("start")!!
          val end = call.argument<Int>("end")
          val substring = if (end != null) {
            StringFunctions().substring(input!!, start, end)
          } else {
            StringFunctions().substring(input!!, start)
          }
          result.success(substring)
        }
        "trim" -> {
          val trimmedString = StringFunctions().trim(input!!)
          result.success(trimmedString)
        }
        "trimLeft" -> {
          val trimmedLeftString = StringFunctions().trimLeft(input!!)
          result.success(trimmedLeftString)
        }
        "trimRight" -> {
          val trimmedRightString = StringFunctions().trimRight(input!!)
          result.success(trimmedRightString)
        }
        else -> result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
