import 'package:flutter/material.dart';
import 'package:insomnotion/models/page.dart';

var examplePage = InsomniacPage("id", "Título de la página");

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
              const TextField()
            ],
          ),
        ),
      ),
    );
  }
}
