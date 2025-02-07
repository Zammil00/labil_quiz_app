import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ResaultPage extends StatefulWidget {
  const ResaultPage({super.key});

  @override
  State<ResaultPage> createState() => _ResaultPageState();
}

class _ResaultPageState extends State<ResaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/animations/piala.json",
              // width: 400,
              // height: 300,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Selamat Nilai Kamu : 10 ",
              style: GoogleFonts.roboto(
                fontSize: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
      )),
    );
  }
}
