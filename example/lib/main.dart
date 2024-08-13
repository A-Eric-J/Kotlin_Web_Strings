import 'package:flutter/material.dart';
import 'package:kotlin_web_strings/kotlin_web_strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kotlin Web Strings Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StringFunctions _stringFunctions = StringFunctions();

  String _reversedString = '';
  String _upperCaseString = '';
  String _lowerCaseString = '';
  int _stringLength = 0;
  String _concatenatedString = '';
  String _replacedString = '';
  bool _containsSubstring = false;
  String _substring = '';
  String _trimmedString = '';
  String _trimmedLeftString = '';
  String _trimmedRightString = '';

  @override
  void initState() {
    super.initState();
    _performStringOperations();
  }

  Future<void> _performStringOperations() async {
    String text = "Hello World";
    String text2 = "Flutter";

    _reversedString = await _stringFunctions.reverseString(text);
    _upperCaseString = await _stringFunctions.toUpperCase(text);
    _lowerCaseString = await _stringFunctions.toLowerCase(text);
    _stringLength = await _stringFunctions.getLength(text);
    _concatenatedString = await _stringFunctions.concatenate(text, text2);
    _replacedString = await _stringFunctions.replaceAll(text, "World", "Flutter");
    _containsSubstring = await _stringFunctions.contains(text, "World");
    _substring = await _stringFunctions.substring(text, 6);
    _trimmedString = await _stringFunctions.trim("  $text  ");
    _trimmedLeftString = await _stringFunctions.trimLeft("  $text  ");
    _trimmedRightString = await _stringFunctions.trimRight("  $text  ");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kotlin Web Strings Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reversed String: $_reversedString"),
              Text("Upper Case String: $_upperCaseString"),
              Text("Lower Case String: $_lowerCaseString"),
              Text("String Length: $_stringLength"),
              Text("Concatenated String: $_concatenatedString"),
              Text("Replaced String: $_replacedString"),
              Text("Contains 'World': $_containsSubstring"),
              Text("Substring from index 6: $_substring"),
              Text("Trimmed String: $_trimmedString"),
              Text("Trimmed Left String: $_trimmedLeftString"),
              Text("Trimmed Right String: $_trimmedRightString"),
            ],
          ),
        ),
      ),
    );
  }
}
