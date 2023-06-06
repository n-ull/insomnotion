import 'package:flutter/material.dart';
import 'package:insomnotion/models/page.dart';

var examplePage = InsomniacPage("id", "Título de la página")..content.add("a");

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<TextField> content = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  examplePage.title,
                  style: const TextStyle(fontSize: 32),
                ),
                ...content
              ],
            ),
          ),
        ),
      )
    );
  }

  @override
  initState() {
    content = getContent();
    super.initState();
  }

  getContent() {
    for (final line in examplePage.content) {
      content.add(TextField(
        controller: TextEditingController(text: line),
        onSubmitted: getNewLine,
      ));
    }
    content.add(TextField(onSubmitted: getNewLine));
    return content;
  }

  getNewLine(value) {
    examplePage.content = [];
    var i = 0;
    var index = 0;
    for (final row in content) {
      if (i > examplePage.content.length) {
        examplePage.content[i] = row.controller?.text ?? "Empty";
      } else {
        examplePage.content.add(row.controller?.text ?? "Empty");
      }
      // TODO: Correctly fetch index instead of considering text as unique
      if ((row.controller?.text ?? "") == value) {
        index = i + 1;
      }
      i++;
    }
    setState(() {
      content.insert(index, TextField(
        controller: TextEditingController(text: "Nueva línea $index"),
        onSubmitted: getNewLine,
      ));
    });
  }
}
