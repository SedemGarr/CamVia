import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_app/Models/Trivia.dart';
import 'package:trivia_app/Services/api.dart';
import 'package:trivia_app/Services/databaseservice.dart';
import 'package:trivia_app/Services/gamelogic.dart';
import 'package:trivia_app/Services/globalvariables.dart';
import 'endpage.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import 'homepage.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final player = AudioCache();
  final audioCache = AudioCache();
  AudioPlayer ticker;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 2;
  Timer timer;
  TriviaAPI api = new TriviaAPI(numberOfQuestions, difficulty, category);
  bool correct = false;

  checkAnswer() {
    if (chosenAnswer == triviaObjects[triviaIndex].correctAnswer) {
      if (hasAudio) {
        player.play('correct.mp3');
      }
      numberOfCorrectAnswers++;
      setState(() {
        isSelectable = false;
        correct = true;
        feedbackColor = Colors.green;
      });
      print(true);
      correctAnswers.add("correct");
      if (triviaObjects[triviaIndex].difficulty == "easy") {
        roundScore = 1;
      }
      if (triviaObjects[triviaIndex].difficulty == "medium") {
        roundScore = 2;
      }
      if (triviaObjects[triviaIndex].difficulty == "hard") {
        roundScore = 3;
      }
      DatabaseService().updateScore(roundScore);
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (triviaIndex < (numberOfQuestions - 1)) {
          setState(() {
            isSelectable = true;
            triviaIndex++;
            chosenAnswer = null;
            correct = false;
          });
        } else {
          isSelectable = true;
          player.clearCache();
          chosenAnswer = null;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => EndPage()));
        }
      });
    } else {
      if (hasAudio) {
        player.play('wrong.mp3');
      }
      setState(() {
        isSelectable = false;
        feedbackColor = Colors.red[900];
      });
      print(false);
      correctAnswers.add("wrong");
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (triviaIndex < (numberOfQuestions - 1)) {
          setState(() {
            isSelectable = true;
            triviaIndex++;
            chosenAnswer = null;
          });
        } else {
          chosenAnswer = null;
          isSelectable = true;
          player.clearCache();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => EndPage()));
        }
      });
    }
  }

  playTicker() async {
    ticker = await audioCache.loop('ticker.mp3');
  }

  @override
  void initState() {
    isSelectable = true;
    Random randomClipper = new Random();
    randomNumberClipper = randomClipper.nextInt(clippers.length);
    print(clippers[randomNumberClipper]);
    super.initState();
    triviaObjects = [];
    triviaIndex = 0;
    if (mode == "Blitz") {
      if (hasAudio) {
        playTicker();
      }
    }
    player.loadAll(['correct.mp3', 'wrong.mp3']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          elevation: 0,
          title: Text(
            mode,
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
              if (mode == "Blitz") {
                ticker?.stop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              } else {
                Navigator.pop(context);
              }
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
              clipper: clippers[randomNumberClipper],
              child: Container(
                decoration: BoxDecoration(color: themeColor),
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.03, 20, 20),
                child: EnhancedFutureBuilder(
                  future: api.getQuestionsRandom(),
                  rememberFutureResult: true,
                  whenDone: (dynamic cat) => Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        mode == "Blitz"
                            ? CountdownTimer(
                                endTime: endTime,
                                onEnd: () {
                                  // stop ticker
                                  ticker?.stop();
                                  correctAnswers.add("wrong");
                                  player.clearCache();
                                  isSelectable = true;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EndPage()));
                                },
                                widgetBuilder: (_, CurrentRemainingTime time) {
                                  print(time);
                                  if (time.min == null && time.sec == null) {
                                    return Container();
                                  } else {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            time.min == null && time.sec == null
                                                ? "Time's up!"
                                                : '${time.min == null ? 0 : time.min} : ${time.sec == null ? 0 : time.sec}',
                                            style: GoogleFonts.chilanka(
                                                fontWeight: FontWeight.bold,
                                                color: themeColor
                                                            .computeLuminance() >
                                                        0.5
                                                    ? Colors.black
                                                    : Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    );
                                  }
                                },
                              )
                            : Container(),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  isDark ? Colors.white : themeColorDeep,
                              child: Text(
                                "${triviaIndex + 1}",
                                style: GoogleFonts.openSansCondensed(
                                  color: isDark ? themeColorDeep : Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                                child: Text(
                              stringCleaner(
                                triviaObjects[triviaIndex].question,
                              ),
                              style: GoogleFonts.openSansCondensed(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: themeColor.computeLuminance() > 0.5
                                      ? Colors.black
                                      : Colors.white),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.19,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: triviaObjects[triviaIndex]
                                .incorrectAnswers
                                .length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    elevation: 0,
                                    color: chosenAnswer ==
                                            triviaObjects[triviaIndex]
                                                .incorrectAnswers[index]
                                        ? feedbackColor
                                        : themeColor,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: chosenAnswer ==
                                                  triviaObjects[triviaIndex]
                                                      .incorrectAnswers[index]
                                              ? feedbackColor
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: ListTile(
                                        onTap: isSelectable
                                            ? () {
                                                chosenAnswer = triviaObjects[
                                                        triviaIndex]
                                                    .incorrectAnswers[index];
                                                print(triviaIndex);
                                                checkAnswer();
                                              }
                                            : () {},
                                        title: Text(
                                          stringCleaner(
                                              triviaObjects[triviaIndex]
                                                  .incorrectAnswers[index]),
                                          style: GoogleFonts.openSansCondensed(
                                              fontWeight: FontWeight.bold,
                                              color: themeColor
                                                          .computeLuminance() >
                                                      0.5
                                                  ? Colors.black
                                                  : Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        mode != "Blitz"
                            ? FAProgressBar(
                                currentValue: (triviaIndex + 1) * 10,
                                maxValue: numberOfQuestions * 10,
                                progressColor:
                                    correct ? feedbackColor : themeColor,
                              )
                            : Container()
                      ],
                    ),
                  ),
                  whenNotDone: Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
