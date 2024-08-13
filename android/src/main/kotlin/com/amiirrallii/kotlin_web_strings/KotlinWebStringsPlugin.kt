package com.amiirrallii.kotlin_web_strings

import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** KotlinWebStringsPlugin */
class KotlinWebStringsPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kotlin_web_strings")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "reverseString" -> {
        val input = call.argument<String>("input")
        result.success(reverseString(input ?: ""))
      }
      "toUpperCase" -> {
        val input = call.argument<String>("input")
        result.success(toUpperCase(input ?: ""))
      }
      "toLowerCase" -> {
        val input = call.argument<String>("input")
        result.success(toLowerCase(input ?: ""))
      }
      "getLength" -> {
        val input = call.argument<String>("input")
        result.success(getLength(input ?: ""))
      }
      "concatenate" -> {
        val input1 = call.argument<String>("input1")
        val input2 = call.argument<String>("input2")
        result.success(concatenate(input1 ?: "", input2 ?: ""))
      }
      "replaceAll" -> {
        val input = call.argument<String>("input")
        val from = call.argument<String>("from")
        val to = call.argument<String>("to")
        result.success(replaceAll(input ?: "", from ?: "", to ?: ""))
      }
      "contains" -> {
        val input = call.argument<String>("input")
        val substring = call.argument<String>("substring")
        result.success(contains(input ?: "", substring ?: ""))
      }
      "substring" -> {
        val input = call.argument<String>("input")
        val start = call.argument<Int>("start")
        val end = call.argument<Int>("end")
        result.success(substring(input ?: "", start ?: 0, end))
      }
      "trim" -> {
        val input = call.argument<String>("input")
        result.success(trim(input ?: ""))
      }
      "trimLeft" -> {
        val input = call.argument<String>("input")
        result.success(trimLeft(input ?: ""))
      }
      "trimRight" -> {
        val input = call.argument<String>("input")
        result.success(trimRight(input ?: ""))
      }
      else -> result.notImplemented()
    }
  }

  private fun reverseString(input: String): String {
    return input.reversed()
  }

  private fun toUpperCase(input: String): String {
    return input.toUpperCase()
  }

  private fun toLowerCase(input: String): String {
    return input.toLowerCase()
  }

  private fun getLength(input: String): Int {
    return input.length
  }

  private fun concatenate(input1: String, input2: String): String {
    return input1 + input2
  }

  private fun replaceAll(input: String, from: String, to: String): String {
    return input.replace(from, to)
  }

  private fun contains(input: String, substring: String): Boolean {
    return input.contains(substring)
  }

  private fun substring(input: String, start: Int, end: Int?): String {
    return if (end != null) {
      input.substring(start, end)
    } else {
      input.substring(start)
    }
  }

  private fun trim(input: String): String {
    return input.trim()
  }

  private fun trimLeft(input: String): String {
    return input.trimStart()
  }

  private fun trimRight(input: String): String {
    return input.trimEnd()
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
