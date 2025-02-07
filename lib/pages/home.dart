import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labil_quiz_app/pages/resault.dart';
import 'package:labil_quiz_app/pages/test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagState();
}

class _HomePagState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ayok Mulai Quiz",
                style: GoogleFonts.montserrat(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukkan Username",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TestPage(),
                    ),
                  );
                },
                child: Text("MULAI"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
