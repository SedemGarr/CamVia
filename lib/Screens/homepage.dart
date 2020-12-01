import 'dart:math';
import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/Screens/leaderboard.dart';
import 'package:trivia_app/Services/auth.dart';
import 'package:trivia_app/Services/databaseservice.dart';
import 'package:trivia_app/Services/globalvariables.dart';
import 'gamepage.dart';
import 'selectcategory.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'settingspage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formatter = NumberFormat("#,###,###");

  saveAudio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("hasAudio", hasAudio);
  }

  saveDifficulty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("difficulty", difficulty);
  }

  void showInfoDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: isDark ? Colors.white : Colors.grey[850],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        // showInfoDialog();
                      },
                      icon: Icon(
                        FontAwesomeIcons.infoCircle,
                        color: themeColorDeep,
                      )),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Cam",
                        style: GoogleFonts.chilanka(
                          color: themeColor,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Via!",
                        style: GoogleFonts.chilanka(
                          color: themeColor,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.infoCircle,
                        color: Colors.transparent,
                      )),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "A trivia app built with Flutter and the Open Trivia DB API",
                            style: GoogleFonts.openSansCondensed(
                                color:
                                    isDark ? Colors.grey[850] : Colors.white),
                          ),
                          Text(
                            'Additional sound effects from zapsplat.com',
                            style: GoogleFonts.openSansCondensed(
                                color:
                                    isDark ? Colors.grey[850] : Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "By Sedem Garr",
                            style: GoogleFonts.openSansCondensed(
                                fontWeight: FontWeight.w500,
                                color:
                                    isDark ? Colors.grey[850] : Colors.white),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("For Camryn",
                              style: GoogleFonts.chilanka(color: themeColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: themeColorDeep,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text(
                    'Close',
                    style: GoogleFonts.openSansCondensed(
                        color: themeColor.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white),
                  ),
                )
              ],
            );
          });
        });
  }

  void showSignOutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: isDark ? Colors.white : Colors.grey[850],
              title: Center(
                  child: Text("Sign Out?",
                      style: GoogleFonts.chilanka(
                          color: isDark ? Colors.grey[850] : Colors.white))),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: themeColorDeep,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text(
                    'Back',
                    style: GoogleFonts.openSansCondensed(
                        color: themeColor.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    AuthService()
                        .signOut()
                        .then((value) => {Phoenix.rebirth(context)});
                  },
                  color: themeColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Text(
                    'Sign Out',
                    style: GoogleFonts.openSansCondensed(
                        color: themeColor.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ],
            );
          });
        });
  }

  Widget getChange() {
    DatabaseService().getHighScores();
    int oldIndex;
    int newIndex;

    newIndex = userScoresComp.indexOf(username);
    oldIndex = oldScores.indexOf(username);

    if (newIndex > oldIndex) {
      return Text("Oops! You've been overtaken. Check out the leaderboard",
          style: GoogleFonts.openSansCondensed(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: themeColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white));
    }
    if (newIndex < oldIndex) {
      return Text("You're on the up! Check out the leaderboard",
          style: GoogleFonts.openSansCondensed(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: themeColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white));
    }
    if (newIndex == oldIndex) {
      return Text("Please select a mode",
          style: GoogleFonts.openSansCondensed(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: themeColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white));
    } else {
      return Text("Please select a mode",
          style: GoogleFonts.openSansCondensed(
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: themeColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white));
    }
  }

  @override
  void initState() {
    Random randomClipper = new Random();
    randomNumberClipper = randomClipper.nextInt(clippers.length);
    if (gotScoresAlready == false) {
      for (int i = 0; i < userScores.length; i++) {
        oldScores.add(userScores[i]["username"]);
      }
      gotScoresAlready = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              showInfoDialog();
            },
            icon: Icon(
              FontAwesomeIcons.infoCircle,
              color: themeColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
            )),
        actions: [
          hasAudio
              ? Icon(
                  FontAwesomeIcons.volumeUp,
                  color: themeColor.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                )
              : Icon(
                  FontAwesomeIcons.volumeMute,
                  color: themeColor.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                ),
          Switch(
            value: hasAudio,
            onChanged: (value) {
              setState(() {
                hasAudio = value;
                saveAudio();
                print(hasAudio);
              });
            },
            activeTrackColor: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            activeColor: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            inactiveThumbColor: themeColorDeep,
            inactiveTrackColor: themeColorDeep,
          ),
        ],
        backgroundColor: themeColor,
        elevation: 0,
        centerTitle: true,
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
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: AnimatedText(
                      alignment: Alignment.center,
                      speed: Duration(milliseconds: 2500),
                      controller: AnimatedTextController.play,
                      displayTime: Duration(milliseconds: 5000),
                      wordList: username != null
                          ? [
                              username,
                              "your score: ${formatter.format(score)}",
                              userScoresComp.indexOf(username) == 0
                                  ? "You're first! Ayekoo"
                                  : userScoresComp.indexOf(username) == 1
                                      ? "You're second! Almost there"
                                      : userScoresComp.indexOf(username) == 2
                                          ? "You're in the top 3!"
                                          : "Welcome",
                              username
                            ]
                          : ['loading', 'game'],
                      textStyle: GoogleFonts.chilanka(
                        fontWeight: FontWeight.bold,
                        color: themeColor.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                      onAnimate: (index) {
                        print("Animating index:" + index.toString());
                      },
                      onFinished: () {
                        print("Animtion finished");
                      },
                      repeatCount: 1,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  getChange()
                ],
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      children: [
                        GestureDetector(
                          onTap: () {
                            chosenAnswer = null;
                            mode = "Quick Quiz";
                            numberOfQuestions = 10;
                            // difficulty = "";
                            category = 0;
                            numberOfCorrectAnswers = 0;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          },
                          child: Card(
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              elevation: 0,
                              child: Container(
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.bolt,
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Quick Quiz",
                                        style: GoogleFonts.openSansCondensed(
                                          color: themeColor.computeLuminance() >
                                                  0.5
                                              ? Colors.black
                                              : Colors.white,
                                        ))
                                  ],
                                )),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            chosenAnswer = null;
                            mode = "Blitz";
                            numberOfQuestions = 150;
                            //  difficulty = "";
                            category = 0;
                            numberOfCorrectAnswers = 0;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          },
                          child: Card(
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              elevation: 0,
                              child: Container(
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.stopwatch,
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Blitz",
                                        style: GoogleFonts.openSansCondensed(
                                          color: themeColor.computeLuminance() >
                                                  0.5
                                              ? Colors.black
                                              : Colors.white,
                                        ))
                                  ],
                                )),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            chosenAnswer = null;
                            mode = "Jack of One";
                            numberOfCorrectAnswers = 0;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SelectCategoryPage()));
                          },
                          child: Card(
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              elevation: 0,
                              child: Container(
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.crown,
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Jack of One",
                                        style: GoogleFonts.openSansCondensed(
                                          color: themeColor.computeLuminance() >
                                                  0.5
                                              ? Colors.black
                                              : Colors.white,
                                        ))
                                  ],
                                )),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LeaderBoardPage()));
                          },
                          child: Card(
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              elevation: 0,
                              child: Container(
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.listOl,
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Leaderboard",
                                        style: GoogleFonts.openSansCondensed(
                                          color: themeColor.computeLuminance() >
                                                  0.5
                                              ? Colors.black
                                              : Colors.white,
                                        ))
                                  ],
                                )),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      difficulty == "easy"
                          ? FlatButton(
                              onPressed: () {
                                setState(() {
                                  difficulty = "";
                                });
                                saveDifficulty();
                              },
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text('Easy',
                                  style: GoogleFonts.openSansCondensed(
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white,
                                  )))
                          : OutlineButton(
                              onPressed: () {
                                setState(() {
                                  difficulty = "easy";
                                });
                                saveDifficulty();
                              },
                              color: themeColor,
                              borderSide: BorderSide(
                                color: themeColor,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text('Easy',
                                  style: GoogleFonts.openSansCondensed(
                                      color: isDark
                                          ? Colors.black
                                          : Colors.white))),
                      difficulty == "medium"
                          ? FlatButton(
                              onPressed: () {
                                setState(() {
                                  difficulty = "";
                                });
                                saveDifficulty();
                              },
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text('Medium',
                                  style: GoogleFonts.openSansCondensed(
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white,
                                  )))
                          : OutlineButton(
                              onPressed: () {
                                setState(() {
                                  difficulty = "medium";
                                });
                                saveDifficulty();
                              },
                              color: themeColor,
                              borderSide: BorderSide(
                                color: themeColor,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text('Medium',
                                  style: GoogleFonts.openSansCondensed(
                                      color: isDark
                                          ? Colors.black
                                          : Colors.white))),
                      difficulty == "hard"
                          ? FlatButton(
                              onPressed: () {
                                setState(() {
                                  difficulty = "";
                                });
                                saveDifficulty();
                              },
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                'Hard',
                                style: GoogleFonts.openSansCondensed(
                                  color: themeColor.computeLuminance() > 0.5
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            )
                          : OutlineButton(
                              onPressed: () {
                                setState(() {
                                  difficulty = "hard";
                                });
                                saveDifficulty();
                              },
                              color: themeColor,
                              borderSide: BorderSide(
                                color: themeColor,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                'Hard',
                                style: GoogleFonts.openSansCondensed(
                                    color:
                                        isDark ? Colors.black : Colors.white),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlineButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                          color: themeColor,
                          borderSide: BorderSide(
                            color: themeColor,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text('Select Theme',
                              style: GoogleFonts.openSansCondensed(
                                  color:
                                      isDark ? Colors.black : Colors.white))),
                      OutlineButton(
                        color: themeColor,
                        borderSide: BorderSide(
                          color: themeColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Sign Out",
                            style: GoogleFonts.openSansCondensed(
                                color: isDark ? Colors.black : Colors.white)),
                        onPressed: () {
                          showSignOutDialog();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
