import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_app/Models/Trivia.dart';
import 'package:trivia_app/Services/databaseservice.dart';
import 'package:trivia_app/Services/globalvariables.dart';
import 'answers.dart';
import 'gamepage.dart';
import 'homepage.dart';
import 'package:confetti/confetti.dart';

class EndPage extends StatefulWidget {
  // const EndPage({Key key}) : super(key: key);
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  ConfettiController _controllerCenterLeft;
  final player = AudioCache();
  bool hasTapped = true;
  String gifIndex;
  final audioCache = AudioCache();
  AudioPlayer mocker;

  getFeedback() {
    if (mode == "Blitz") {
      if (numberOfCorrectAnswers == 0) {
        gifIndex = '6';
        return Text(
          'Close the app and let\'s both go home 😒',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers / numberOfQuestions > 0 &&
          numberOfCorrectAnswers / numberOfQuestions <= 25 / 100) {
        gifIndex = '9';
        return Text(
          'We don\'t know you. Stop looking at us',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers / numberOfQuestions > 25 / 100 &&
          numberOfCorrectAnswers / numberOfQuestions <= 75 / 100) {
        gifIndex = '7';
        return Text(
          'Don\'t know what to tell you. You\'re average 🤷',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers / numberOfQuestions > 75 / 100 &&
          numberOfCorrectAnswers / numberOfQuestions < 100 / 100) {
        gifIndex = '8';
        return Text(
          'Look at you go!',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers == numberOfQuestions) {
        gifIndex = "4";
        return Text(
          'Are you human? Wow! 😲',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
    } else {
      if (numberOfCorrectAnswers == 0) {
        gifIndex = '0';
        return Text(
          'Let\'s keep this to ourselves. No one has to know 😢',
          style: GoogleFonts.chilanka(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers / numberOfQuestions > 0 &&
          numberOfCorrectAnswers / numberOfQuestions <= 25 / 100) {
        gifIndex = '1';
        return Text(
          'We\'ve seen worse. Your first try specifically',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers / numberOfQuestions > 25 / 100 &&
          numberOfCorrectAnswers / numberOfQuestions <= 75 / 100) {
        gifIndex = '2';
        return Text(
          'Don\'t know what to tell you. You\'re average 🤷',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers / numberOfQuestions > 75 / 100 &&
          numberOfCorrectAnswers / numberOfQuestions < 100 / 100) {
        gifIndex = '3';
        return Text(
          'Smarty pants 😏',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
      if (numberOfCorrectAnswers == numberOfQuestions) {
        gifIndex = "4";
        return Text(
          'We always knew you could do it. We told all our friends already 👏',
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        );
      }
    }
  }

  getAudio() {
    if (numberOfCorrectAnswers == numberOfQuestions) {
      _controllerCenterLeft.play();
      if (hasAudio) {
        player.play('applause.mp3');
      }
    }
  }

  playAudio(song) async {
    if (hasAudio) {
      mocker = await audioCache.loop(song);
    }
  }

  @override
  void initState() {
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    getAudio();
    if (numberOfCorrectAnswers == numberOfQuestions) {
      DatabaseService().updateScore(100);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: themeColor,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              color: isDark ? Colors.white : Colors.grey[850],
            ),
            ClipPath(
              clipper: clippers[randomNumberClipper],
              child: Container(
                decoration: BoxDecoration(color: themeColor),
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ),
            Container(
              child: Column(
                children: [
                  mode == "Blitz"
                      ? Text(
                          "Time's Up!",
                          style: GoogleFonts.chilanka(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: themeColor.computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white,
                          ),
                        )
                      : Text(
                          "You're done!",
                          style: GoogleFonts.chilanka(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: themeColor.computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  getFeedback(),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.1,
                  // ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          hasTapped = !hasTapped;
                          if (numberOfCorrectAnswers == 0 && mode != "Blitz") {
                            if (hasTapped == false) {
                              playAudio('coffin.mp3');
                            } else {
                              mocker?.stop();
                            }
                          } else if (numberOfCorrectAnswers ==
                              numberOfQuestions) {
                            if (hasTapped == false) {
                              playAudio('swag.mp3');
                            } else {
                              mocker?.stop();
                            }
                          }
                        });
                      },
                      child: Card(
                        //semanticContainer: true,
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        elevation: 0,
                        child: hasTapped
                            ? Column(
                                children: [
                                  Center(
                                    child: Container(
                                      width: roundScore == 0
                                          ? MediaQuery.of(context).size.width *
                                              1 /
                                              5
                                          : MediaQuery.of(context).size.width *
                                              1 /
                                              3,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          mode == "Blitz"
                                              ? "${numberOfCorrectAnswers.toString()}"
                                              : "${numberOfCorrectAnswers.toString()} / ${numberOfQuestions.toString()}",
                                          style: GoogleFonts.openSansCondensed(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                themeColor.computeLuminance() >
                                                        0.5
                                                    ? Colors.black
                                                    : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1 /
                                                4,
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            "your score",
                                            style:
                                                GoogleFonts.openSansCondensed(
                                              // fontSize: 40,
                                              // fontWeight: FontWeight.bold,
                                              color: themeColor
                                                          .computeLuminance() >
                                                      0.5
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Image.asset(
                                  'assets/$gifIndex.gif',
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  numberOfCorrectAnswers == numberOfQuestions
                      ? Text('Clean run! +100 bonus',
                          style: GoogleFonts.chilanka(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.bold,
                            color: themeColor.computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white,
                          ))
                      : Container(),
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlineButton(
                        color: themeColor,
                        borderSide: BorderSide(
                          color: themeColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Play Again",
                          style: GoogleFonts.openSansCondensed(
                            // fontWeight: FontWeight.bold,
                            color: isDark ? Colors.black : Colors.white,
                          ),
                        ),
                        onPressed: () {
                          triviaIndex = 0;
                          roundScore = 0;
                          numberOfCorrectAnswers = 0;
                          correctAnswers = [];
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePage()));
                        },
                      ),
                      FlatButton(
                        color: themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Check Answers",
                          style: GoogleFonts.openSansCondensed(
                            //  fontWeight: FontWeight.bold,
                            color: themeColor.computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnswersPage()));
                        },
                      ),
                      OutlineButton(
                        color: themeColor,
                        borderSide: BorderSide(
                          color: themeColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Home",
                          style: GoogleFonts.openSansCondensed(
                            //  fontWeight: FontWeight.bold,
                            color: isDark ? Colors.black : Colors.white,
                          ),
                        ),
                        onPressed: () {
                          roundScore = 0;
                          triviaIndex = 0;
                          numberOfCorrectAnswers = 0;
                          triviaObjects = [];
                          correctAnswers = [];
                          mode = null;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenterLeft,
                blastDirection: pi / 1.5, // radial value - RIGHT
                emissionFrequency: 0.15,
                minimumSize: const Size(10,
                    10), // set the minimum potential size for the confetti (width, height)
                maximumSize: const Size(50,
                    50), // set the maximum potential size for the confetti (width, height)
                numberOfParticles: 1,
                gravity: 0.1,
                colors: colors,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenterLeft,
                blastDirection: pi / 2.5, // radial value - RIGHT
                emissionFrequency: 0.15,
                minimumSize: const Size(10,
                    10), // set the minimum potential size for the confetti (width, height)
                maximumSize: const Size(50,
                    50), // set the maximum potential size for the confetti (width, height)
                numberOfParticles: 1,
                gravity: 0.1,
                colors: colors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
