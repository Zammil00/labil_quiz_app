import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:labil_quiz_app/pages/home.dart';
import 'package:labil_quiz_app/pages/result.dart';
import 'package:labil_quiz_app/pages/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
    );
  }
}
