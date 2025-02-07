import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labil_quiz_app/models/question_model.dart';

class TestPage extends StatefulWidget {
  final QuestionModel questionModel;
  final String username;
  const TestPage(
      {super.key, required this.questionModel, required this.username});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _controller = CountDownController();

  @override
  void initState() {
    // TODO: implement initState
    if (kDebugMode) {
      print("USERNAME = ${widget.username}");
    }
    if (kDebugMode) {
      print("DATA = ${widget.questionModel.data.length}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "1 / ${widget.questionModel.data.length}",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.username,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              width: 170,
              child: CountDownProgressIndicator(
                controller: _controller,
                valueColor: Colors.deepPurpleAccent,
                backgroundColor: Colors.white,
                initialPosition: 0,
                duration: 60,
                // timeFormatter: (second) {
                //   return Duration(seconds: second)
                //       .toString()
                //       .split('.')[0]
                //       .padLeft(8, '0');
                // },
                text: 'Detik',
                labelTextStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                ),
                timeTextStyle: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.white,
                ),
                onComplete: () => null,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Tujuan Bahasa HTML...",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {},
              child: OptionWidget(
                optionChar: "A",
                optionDetail: "Untuk Android",
                color: Colors.blue,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionWidget(
                optionChar: "B",
                optionDetail: "Untuk Ios",
                color: Colors.cyan,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionWidget(
                optionChar: "C",
                optionDetail: "Untuk Website",
                color: Colors.indigo,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionWidget(
                optionChar: "D",
                optionDetail: "Untuk Linux",
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String optionChar;
  final String optionDetail;
  final Color color;

  const OptionWidget({
    super.key,
    required this.optionChar,
    required this.optionDetail,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                optionChar,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  optionDetail,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
