package com.amiirrallii.kotlin_web_strings

class StringFunctions {

    fun reverseString(input: String): String {
        return input.reversed()
    }

    fun toUpperCase(input: String): String {
        return input.uppercase()
    }

    fun toLowerCase(input: String): String {
        return input.lowercase()
    }

    fun capitalizeString(input: String): String {
        return input.replaceFirstChar { if (it.isLowerCase()) it.titlecase() else it.toString() }
    }

    fun getLength(input: String): Int {
        return input.length
    }

    fun isPalindrome(input: String): Boolean {
        return input == input.reversed()
    }

    fun countVowels(input: String): Int {
        return input.count { "aeiouAEIOU".contains(it) }
    }

    fun replaceSpaces(input: String, replacement: String): String {
        return input.replace(" ", replacement)
    }

    fun getFirstCharacter(input: String): Char? {
        return input.firstOrNull()
    }

    fun getLastCharacter(input: String): Char? {
        return input.lastOrNull()
    }

    fun containsSubstring(input: String, substring: String): Boolean {
        return input.contains(substring)
    }
}
