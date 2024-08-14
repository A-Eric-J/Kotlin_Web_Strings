# Kotlin Web Strings

`kotlin_web_strings` is a Flutter plugin that provides string manipulation utilities for both Android and Web platforms. It leverages native Kotlin functions on Android and JavaScript functions on Web to perform various string operations.

## Features

- **Reverse a String**: Reverse the characters in a string.
- **Convert to Uppercase**: Convert all characters in a string to uppercase.
- **Convert to Lowercase**: Convert all characters in a string to lowercase.
- **Get Length**: Retrieve the number of characters in a string.
- **Concatenate Strings**: Combine two strings into one.
- **Replace Substring**: Replace occurrences of a substring with another substring.
- **Check for Substring**: Check if a string contains a specific substring.
- **Substring**: Extract a part of a string based on start and end positions.
- **Trim**: Remove whitespace from the beginning and end of a string.
- **Trim Left/Right**: Remove whitespace from the start or end of a string.

## Installation

1. Add the dependency to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     kotlin_web_strings:
       path: https://github.com/A-Eric-J/Kotlin_Web_Strings.git
   ```

2. Run `flutter pub get` to install the plugin.

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:kotlin_web_strings/kotlin_web_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final stringFunctions = StringFunctions();

  String reversed = await stringFunctions.reverseString("Hello");
  print("Reversed: $reversed");  // Output: "olleH"

  String uppercased = await stringFunctions.toUpperCase("hello");
  print("Uppercased: $uppercased");  // Output: "HELLO"
  
  // Add more examples as needed
}

```

## Platforms Supported

- **Android**: Uses native Kotlin for string operations.
- **Web**: Uses JavaScript injected into the browser's global context.

## Contributing

Feel free to fork the repository and submit pull requests. Contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

