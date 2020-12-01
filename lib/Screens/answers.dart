import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_app/Models/Trivia.dart';
import 'package:trivia_app/Services/gamelogic.dart';
import 'package:trivia_app/Services/globalvariables.dart';

class AnswersPage extends StatefulWidget {
  @override
  _AnswersPageState createState() => _AnswersPageState();
}

class _AnswersPageState extends State<AnswersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        title: Text(
          "Answers",
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: isDark ? Colors.white : Colors.grey[850],
          ),
          ClipPath(
            clipper: WaveClipperOne(flip: true),
            child: Container(
              decoration: BoxDecoration(color: themeColor),
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
          Container(
              child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.049, 20, 20),
            child: ListView.builder(
              itemCount:
                  mode == "Blitz" ? (triviaIndex + 1) : numberOfQuestions,
              itemBuilder: (context, index) {
                return Card(
                  color: correctAnswers[index] == "correct"
                      ? Colors.green[500]
                      : Colors.red[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  elevation: 0,
                  child: ListTile(
                    // leading: correctAnswers[index] == "correct"
                    //     ? Icon(Icons.check_circle, color: Colors.green)
                    //     : Stack(children: [
                    //         Icon(Icons.circle, color: Colors.red[900]),
                    //         Icon(Icons.close_rounded,
                    //             color: randomNumber == 0
                    //                 ? Colors.indigo[900]
                    //                 : Colors.pink[900])
                    //       ]),
                    trailing: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.openSansCondensed(
                          fontWeight: FontWeight.bold,
                          color: themeColor.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white),
                    ),
                    title: Text(
                      stringCleaner(
                        triviaObjects[index].question,
                      ),
                      style: GoogleFonts.openSansCondensed(
                          fontWeight: FontWeight.bold,
                          color: themeColor.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white),
                    ),
                    subtitle: Text(
                      stringCleaner(
                        triviaObjects[index].correctAnswer,
                      ),
                      style: GoogleFonts.openSansCondensed(
                          color: themeColor.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      ),
    ));
  }
}
