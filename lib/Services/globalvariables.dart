import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';

// error
String error = "";

// user data
String username;
String email;
String password;
String password1;
String about;
String userid;

// loading booleans
bool loading = true;
bool isDark = true;
bool loadingWidget = false;
bool gotScoresAlready = false;
bool isSelectable = true;

// audio boolean
bool hasAudio = true;

// scores
int roundScore = 0;
int score = 0;

// selected answer
String chosenAnswer;

// questions
int numberOfQuestions;
String difficulty;
int category;

int numberOfCorrectAnswers = 0;

Color feedbackColor = Colors.transparent;

// for mode
String mode;

// for category scores
List categories = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
];

// for leaderboard
List userScores = [];
List oldScores = [];
List userScoresComp = [];

// random numbers for theme
int randomNumber;
int randomNumberClipper;

// clippers
List clippers = [
  OvalBottomBorderClipper(),
  WaveClipperTwo(flip: true),
  WaveClipperTwo(),
  WaveClipperOne(),
  WaveClipperOne(flip: true),
  DiagonalPathClipperOne(),
  DiagonalPathClipperTwo(),
];

// for view answers page
List correctAnswers = [];

// colors
String color;
Color themeColor;
Color themeColorDeep;
Color leaderboardColorUser;
Color leaderboardColorElse;
List<Color> colors = [
  Colors.blue,
  Colors.indigo,
  Colors.pink,
  Colors.orange,
  Colors.purple,
  Colors.brown,
  Colors.blueGrey,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.amber,
  Colors.lime,
  Colors.teal,
  Colors.cyan,
  Colors.lightBlue,
  Colors.grey
];

// determine color
getColor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('color') == null) {
    color = 'random';
  } else {
    color = prefs.getString('color');
  }

  if (color == 'random') {
    Random random = new Random();
    themeColor = colors[random.nextInt(colors.length)];
    if (themeColor == Colors.blue) {
      themeColorDeep = Colors.blue[900];
    }
    if (themeColor == Colors.indigo) {
      themeColorDeep = Colors.indigo[900];
    }
    if (themeColor == Colors.pink) {
      themeColorDeep = Colors.pink[900];
    }
    if (themeColor == Colors.orange) {
      themeColorDeep = Colors.orange[900];
    }
    if (themeColor == Colors.purple) {
      themeColorDeep = Colors.purple[900];
    }
    if (themeColor == Colors.brown) {
      themeColorDeep = Colors.brown[900];
    }
    if (themeColor == Colors.blueGrey) {
      themeColorDeep = Colors.blueGrey[900];
    }
    if (themeColor == Colors.deepOrange) {
      themeColorDeep = Colors.deepOrange[900];
    }
    if (themeColor == Colors.deepPurple) {
      themeColorDeep = Colors.deepPurple[900];
    }
    if (themeColor == Colors.amber) {
      themeColorDeep = Colors.amber[900];
    }
    if (themeColor == Colors.lime) {
      themeColorDeep = Colors.lime[900];
    }
    if (themeColor == Colors.teal) {
      themeColorDeep = Colors.teal[900];
    }
    if (themeColor == Colors.cyan) {
      themeColorDeep = Colors.cyan[900];
    }
    if (themeColor == Colors.lightBlue) {
      themeColorDeep = Colors.lightBlue[900];
    }
    if (themeColor == Colors.grey) {
      themeColorDeep = Colors.grey[900];
    }
    //return themeColor;
  }
  // above is for random
  // below is for manual colours
  if (color == "blue") {
    themeColor = Colors.blue;
    themeColorDeep = Colors.blue[900];
    //return themeColor;
  }
  if (color == "indigo") {
    themeColor = Colors.indigo;
    themeColorDeep = Colors.indigo[900];
    //return themeColor;
  }
  if (color == "pink") {
    themeColor = Colors.pink;
    themeColorDeep = Colors.pink[900];
    //return themeColor;
  }
  if (color == "orange") {
    themeColor = Colors.orange;
    themeColorDeep = Colors.orange[900];
    //return themeColor;
  }
  if (color == "purple") {
    themeColor = Colors.purple;
    themeColorDeep = Colors.purple[900];
    //return themeColor;
  }
  if (color == "brown") {
    themeColor = Colors.brown;
    themeColorDeep = Colors.brown[900];
    //return themeColor;
  }
  if (color == "blueGrey") {
    themeColor = Colors.blueGrey;
    themeColorDeep = Colors.blueGrey[900];
    //return themeColor;
  }
  if (color == "deepOrange") {
    themeColor = Colors.deepOrange;
    themeColorDeep = Colors.deepOrange[900];
    //return themeColor;
  }
  if (color == "deepPurple") {
    themeColor = Colors.deepPurple;
    themeColorDeep = Colors.deepPurple[900];
    //return themeColor;
  }
  if (color == "amber") {
    themeColor = Colors.amber;
    themeColorDeep = Colors.amber[900];
    //return themeColor;
  }
  if (color == "lime") {
    themeColor = Colors.lime;
    themeColorDeep = Colors.lime[900];
    //return themeColor;
  }
  if (color == "teal") {
    themeColor = Colors.teal;
    themeColorDeep = Colors.teal[900];
    //return themeColor;
  }
  if (color == "cyan") {
    themeColor = Colors.cyan;
    themeColorDeep = Colors.cyan[900];
    //return themeColor;
  }
  if (color == "lightBlue") {
    themeColor = Colors.lightBlue;
    themeColorDeep = Colors.lightBlue[900];
    //return themeColor;
  }
  if (color == "grey") {
    themeColor = Colors.grey;
    themeColorDeep = Colors.grey[900];
    //return themeColor;
  }
  // if color is null
  if (color == null) {
    Random random = new Random();
    themeColor = colors[random.nextInt(colors.length)];
    if (themeColor == Colors.blue) {
      themeColorDeep = Colors.blue[900];
    }
    if (themeColor == Colors.indigo) {
      themeColorDeep = Colors.indigo[900];
    }
    if (themeColor == Colors.pink) {
      themeColorDeep = Colors.pink[900];
    }
    if (themeColor == Colors.orange) {
      themeColorDeep = Colors.orange[900];
    }
    if (themeColor == Colors.purple) {
      themeColorDeep = Colors.purple[900];
    }
    if (themeColor == Colors.brown) {
      themeColorDeep = Colors.brown[900];
    }
    if (themeColor == Colors.blueGrey) {
      themeColorDeep = Colors.blueGrey[900];
    }
    if (themeColor == Colors.deepOrange) {
      themeColorDeep = Colors.deepOrange[900];
    }
    if (themeColor == Colors.deepPurple) {
      themeColorDeep = Colors.deepPurple[900];
    }
    if (themeColor == Colors.amber) {
      themeColorDeep = Colors.amber[900];
    }
    if (themeColor == Colors.lime) {
      themeColorDeep = Colors.lime[900];
    }
    if (themeColor == Colors.teal) {
      themeColorDeep = Colors.teal[900];
    }
    if (themeColor == Colors.cyan) {
      themeColorDeep = Colors.cyan[900];
    }
    if (themeColor == Colors.lightBlue) {
      themeColorDeep = Colors.lightBlue[900];
    }
    if (themeColor == Colors.grey) {
      themeColorDeep = Colors.grey[900];
    }
  }
  // else {
  //   themeColor = Colors.blue;
  //   themeColorDeep = Colors.black;
  //   //return themeColor;
  // }
}

saveColor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (color == "random") {
    prefs.setString('color', color);
  } else {
    if (themeColor == Colors.blue) {
      color = 'blue';
    }
    if (themeColor == Colors.indigo) {
      color = 'indigo';
    }
    if (themeColor == Colors.pink) {
      color = 'pink';
    }
    if (themeColor == Colors.orange) {
      color = 'orange';
    }
    if (themeColor == Colors.purple) {
      color = 'purple';
    }
    if (themeColor == Colors.brown) {
      color = 'brown';
    }
    if (themeColor == Colors.blueGrey) {
      color = 'blueGrey';
    }
    if (themeColor == Colors.deepOrange) {
      color = 'deepOrange';
    }
    if (themeColor == Colors.deepPurple) {
      color = 'deepPurple';
    }
    if (themeColor == Colors.amber) {
      color = 'amber';
    }
    if (themeColor == Colors.lime) {
      color = 'lime';
    }
    if (themeColor == Colors.teal) {
      color = 'teal';
    }
    if (themeColor == Colors.cyan) {
      color = 'cyan';
    }
    if (themeColor == Colors.lightBlue) {
      color = 'lightBlue';
    }
    if (themeColor == Colors.grey) {
      color = 'grey';
    }
    prefs.setString('color', color);
  }
}
