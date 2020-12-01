import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_app/Screens/gamepage.dart';
import 'package:trivia_app/Services/globalvariables.dart';

class SelectCategoryPage extends StatefulWidget {
  @override
  _SelectCategoryPageState createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          elevation: 0,
          title: Text(
            'Choose a Category',
            style: GoogleFonts.chilanka(
              fontWeight: FontWeight.bold,
              color: themeColor.computeLuminance() > 0.5
                  ? Colors.black
                  : themeColor.computeLuminance() > 0.5
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
                    20, MediaQuery.of(context).size.height * 0.049, 20, 0),
                child: GridView.count(
                  // scrollDirection: Axis.horizontal,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: [
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 9;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.globeAsia,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "General Knowledge",
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 10;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.bookOpen,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Books",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 11;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.video,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Film",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 12;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.music,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Music",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 13;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.theaterMasks,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Musicals & Theatres",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 14;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.tv,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Television",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 15;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.gamepad,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Video Games",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 16;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.chessBoard,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Board Games",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 17;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.microscope,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Science & Nature",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 18;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.laptopCode,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Science: Computers",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 19;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.sortNumericDown,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Science: Mathematics",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 20;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.piedPiperAlt,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Mythology",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 21;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.footballBall,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Sports",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 22;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.mountain,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Geography",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 23;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.monument,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "History",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 24;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.users,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Politics",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 25;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.paintBrush,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Art",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 26;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.userTie,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Celebrities",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 27;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.dog,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Animals",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 28;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.carAlt,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Vehicles",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 29;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.bookOpen,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Comics",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 30;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.mobileAlt,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Science: Gadgets",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 31;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.userNinja,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Japanese Anime & Manga",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        numberOfQuestions = 20;
                        difficulty = "";
                        category = 32;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      },
                      child: Card(
                        color: themeColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.snowman,
                                    color: themeColor.computeLuminance() > 0.5
                                        ? Colors.black
                                        : Colors.white),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  "Entertainment: Cartoon & Animations",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSansCondensed(
                                      color: themeColor.computeLuminance() > 0.5
                                          ? Colors.black
                                          : Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
