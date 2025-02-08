import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labil_quiz_app/models/question_model.dart';
import 'package:labil_quiz_app/pages/result.dart';

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
  int index = 0;
  int result = 0;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("USERNAME = ${widget.username}");
      print("DATA = ${widget.questionModel.data.length}");
    }
  }

  void navigate(String optionChar) {
    if (kDebugMode) {
      print("Jawaban yang dipilih: $optionChar");
      print("Jawaban yang benar: ${widget.questionModel.data[index].jawaban}");
    }

    setState(() {
      if (optionChar == widget.questionModel.data[index].jawaban) {
        result++;
        if (kDebugMode) {
          print("Jawaban benar! Nilai saat ini: $result");
        }
      }

      if (index + 1 < widget.questionModel.data.length) {
        index++;
      } else {
        _navigateToResult();
      }
    });
  }

  void _navigateToResult() {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) => ResultPage(
                  result: result,
                )))
        .then((value) {
      setState(() {});
    });
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
                    "${index + 1} / ${widget.questionModel.data.length}",
                    style:
                        GoogleFonts.roboto(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    widget.username,
                    style:
                        GoogleFonts.roboto(fontSize: 18, color: Colors.white),
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
                text: 'Detik',
                labelTextStyle:
                    GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                timeTextStyle:
                    GoogleFonts.roboto(fontSize: 25, color: Colors.white),
                onComplete: _navigateToResult,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.questionModel.data[index].soal,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 25),
              ),
            ),
            const SizedBox(height: 50),
            ...['A', 'B', 'C', 'D'].map((option) {
              return GestureDetector(
                onTap: () => navigate(option.toLowerCase()),
                child: OptionWidget(
                  optionChar: option,
                  optionDetail:
                      widget.questionModel.data[index].getOption(option),
                  color: Colors.blueGrey,
                ),
              );
            }).toList(),
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
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                optionChar,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  optionDetail,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
