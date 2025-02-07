import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labil_quiz_app/models/question_model.dart';
import 'package:labil_quiz_app/pages/resault.dart';
import 'package:labil_quiz_app/pages/test.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagState();
}

class _HomePagState extends State<HomePage> {
  late QuestionModel questionModel;
  TextEditingController userNameController = TextEditingController();


  final String url =
      "https://script.googleusercontent.com/macros/echo?user_content_key=udmtZDqH8CR5cdWQtCm2twsv_eqq3_4-TUVL1j9M8OA6AM-vX8JZ6ofLcu8axQ2_PDyqsSNn3RclZkFrZ4LVUHkIaBIHZVJRm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPn2Rp_v7tCBpPO0y8x9KflvsiHSm726RX95S3soShDSBNgEjS6U6wNS0E8wTt0Y47oMQNs4EBpRLQrDhtVWucCbPvbSE9Pung&lib=MxJeodo0Fn1fOTAKQpZ_B-m3b4bWQYTXk";

  void getAllData(String username) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (kDebugMode) {
        print("PRINTT ATASS = ${response.body}");
      }

      if (response.statusCode == 200) {
        questionModel = QuestionModel.fromJson(jsonDecode(response.body));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => TestPage(
                questionModel: questionModel,
                username: username,
              ),
            ));

        if (kDebugMode) {
          print("HASIL API = ${questionModel.data.length}");
        }
      } else {
        if (kDebugMode) {
          print("Gagal mengambil data: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Terjadi kesalahan: $e");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    // print("USERNAME :" + widget.username.);
    super.initState();
  }

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
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: "Masukkan Username",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  getAllData(userNameController.text);
                },
                child: Text("M U L A I"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
