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

  String text1 = "Hello World";
  String text2 = "Flutter";
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

    _reversedString = await _stringFunctions.reverseString(text1);
    _upperCaseString = await _stringFunctions.toUpperCase(text1);
    _lowerCaseString = await _stringFunctions.toLowerCase(text1);
    _stringLength = await _stringFunctions.getLength(text1);
    _concatenatedString = await _stringFunctions.concatenate(text1, text2);
    _replacedString = await _stringFunctions.replaceAll(text1, "World", "Flutter");
    _containsSubstring = await _stringFunctions.contains(text1, "World");
    _substring = await _stringFunctions.substring(text1, 6);
    _trimmedString = await _stringFunctions.trim("  $text1  ");
    _trimmedLeftString = await _stringFunctions.trimLeft("  $text1  ");
    _trimmedRightString = await _stringFunctions.trimRight("  $text1  ");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("Kotlin Web Strings Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Text 1: $text1",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(width: 16,),
                  Text("Text 2: $text2", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Text("Reversed String: $_reversedString"),
              SizedBox(height: 8,),
              Text("Upper Case String: $_upperCaseString"),
              SizedBox(height: 8,),
              Text("Lower Case String: $_lowerCaseString"),
              SizedBox(height: 8,),
              Text("String Length: $_stringLength"),
              SizedBox(height: 8,),
              Text("Concatenated String: $_concatenatedString"),
              SizedBox(height: 8,),
              Text("Replaced String: $_replacedString"),
              SizedBox(height: 8,),
              Text("Contains 'World': $_containsSubstring"),
              SizedBox(height: 8,),
              Text("Substring from index 6: $_substring"),
              SizedBox(height: 8,),
              Text("Trimmed String: $_trimmedString"),
              SizedBox(height: 8,),
              Text("Trimmed Left String: $_trimmedLeftString"),
              SizedBox(height: 8,),
              Text("Trimmed Right String: $_trimmedRightString"),
            ],
          ),
        ),
      ),
    );
  }
}
