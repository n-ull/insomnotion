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
        body: Padding(
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
    );
  }

  @override
  initState() {
    content = getContent();
    super.initState();
  }

  getContent() {
    var index = 0;
    for (final line in examplePage.content) {
      content.add(TextField(
        controller: TextEditingController(text: line),
        onSubmitted: (value) {
          setState(() { content.insert(index, TextField(
            controller: TextEditingController(text: "Nueva: ${value}")
          )); });
        },
      ));
      index++;
    }
    content.add(TextField(onSubmitted: (value) {
      setState(() { content.insert(content.length, TextField(
          controller: TextEditingController(text: "Nueva: ${value}")
      )); });
    }));
    return content;
  }
}
