import 'package:flutter/material.dart';
import 'package:fresh_walls/Wallpaper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan,
      ),
      home: const Wallpaper(),  // Ensure Wallpaper is referenced correctly
    );
  }
}