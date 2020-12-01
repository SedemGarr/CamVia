import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:trivia_app/Services/globalvariables.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  final formatter = NumberFormat("#,###,###");
  ItemScrollController _scrollController = ItemScrollController();
  int tempindextemp;
  int tempindex;

  String getTopCategory(int index) {
    String topCategory;
    List tempCategory = userScores[index]["categories"];
    tempCategory.sort();

    switch (userScores[index]["categories"]
        .indexOf(tempCategory[tempCategory.length - 1])) {
      case 0:
        topCategory = "General Knowledge";
        break;
      case 1:
        topCategory = "Entertainment: Books";
        break;
      case 2:
        topCategory = "Entertainment: Film";
        break;
      case 3:
        topCategory = "Entertainment: Music";
        break;
      case 4:
        topCategory = "Entertainment: Musicals & Theatres";
        break;
      case 5:
        topCategory = "Entertainment: Television";
        break;
      case 6:
        topCategory = "Entertainment: Video Games";
        break;
      case 7:
        topCategory = "Entertainment: Board Games";
        break;
      case 8:
        topCategory = "Science & Nature";
        break;
      case 9:
        topCategory = "Science: Computers";
        break;
      case 10:
        topCategory = "Science: Mathematics";
        break;
      case 11:
        topCategory = "Mythology";
        break;
      case 12:
        topCategory = "Sports";
        break;
      case 13:
        topCategory = "Geography";
        break;
      case 14:
        topCategory = "History";
        break;
      case 15:
        topCategory = "Politics";
        break;
      case 16:
        topCategory = "Art";
        break;
      case 17:
        topCategory = "Celebrities";
        break;
      case 18:
        topCategory = "Animals";
        break;
      case 19:
        topCategory = "Vehicles";
        break;
      case 20:
        topCategory = "Entertainment: Comics";
        break;
      case 21:
        topCategory = "Science: Gadgets";
        break;
      case 22:
        topCategory = "Entertainment: Japanese Anime & Manga";
        break;
      case 23:
        topCategory = "Entertainment: Cartoon & Animations";
        break;
    }

    return topCategory;
  }

  Widget getChange(int index) {
    oldScores.indexOf(userScores[index]["username"].toString());

    if (index > oldScores.indexOf(userScores[index]["username"].toString())) {
      print(oldScores.indexOf(userScores[index]["username"].toString()));
      return Icon(
        Icons.arrow_downward,
        color:
            themeColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      );
    }
    if (index < oldScores.indexOf(userScores[index]["username"].toString())) {
      return Icon(
        Icons.arrow_upward,
        color:
            themeColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      );
    }
    if (index == oldScores.indexOf(userScores[index]["username"].toString())) {
      return Icon(
        Icons.remove,
        color:
            themeColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
      );
    } else {
      return Container();
    }
  }

  @override
  initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      _scrollController.scrollTo(
          index: tempindextemp, duration: Duration(seconds: 2));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        title: Text(
          "Leaderboard",
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
            for (int i = 0; i < userScores.length; i++) {
              oldScores.add(userScores[i]["username"]);
            }
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Expanded(
                  child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      itemCount: userScores.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        for (int i = 0; i < userScores.length; i++) {
                          if (username ==
                              userScores[i]["username"].toString()) {
                            tempindextemp = i;
                          }
                        }
                        try {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Card(
                                elevation: 0,
                                color: username ==
                                        userScores[index]["username"].toString()
                                    ? themeColorDeep == null
                                        ? themeColor
                                        : themeColorDeep
                                    : themeColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: ExpansionTile(
                                  subtitle: Text(
                                    "Top Category: " + getTopCategory(index),
                                    style: GoogleFonts.openSansCondensed(
                                        color:
                                            themeColor.computeLuminance() > 0.5
                                                ? Colors.black
                                                : Colors.white),
                                  ),
                                  leading: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      index == 0
                                          ? Icon(
                                              FontAwesomeIcons.crown,
                                              color: Colors.yellow,
                                            )
                                          : Icon(Icons.person,
                                              color: themeColor
                                                          .computeLuminance() >
                                                      0.5
                                                  ? Colors.black
                                                  : Colors.white),
                                    ],
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        (index + 1).toString(),
                                        style: GoogleFonts.openSansCondensed(
                                            color:
                                                themeColor.computeLuminance() >
                                                        0.5
                                                    ? Colors.black
                                                    : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        userScores[index]["username"]
                                            .toString(),
                                        style: GoogleFonts.chilanka(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                themeColor.computeLuminance() >
                                                        0.5
                                                    ? Colors.black
                                                    : Colors.white),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      getChange(index)
                                    ],
                                  ),
                                  trailing: Text(
                                    formatter
                                        .format(userScores[index]["score"])
                                        .toString(),
                                    style: GoogleFonts.openSansCondensed(
                                        color:
                                            themeColor.computeLuminance() > 0.5
                                                ? Colors.black
                                                : Colors.white),
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "General Knowledge",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [0]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Books",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [1]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Film",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [2]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Music",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [3]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Musicals & Theatres",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [4]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Television",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [5]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Video Games",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [6]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Board Games",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [7]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Science & Nature",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [8]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Science: Computers",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [9]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Science: Mathematics",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [10]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Mythology",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [11]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Sports",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [12]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Geography",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [13]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "History",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [14]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Politics",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [15]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Art",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [16]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Celebrities",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [17]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Animals",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [18]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Vehicles",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [19]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Comics",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [20]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Science: Gadgets",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [21]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Japanese Anime & Manga",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [22]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Entertainment: Cartoon & Animations",
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                              Text(
                                                userScores[index]["categories"]
                                                        [23]
                                                    .toString(),
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                        color: themeColor
                                                                    .computeLuminance() >
                                                                0.5
                                                            ? Colors.black
                                                            : Colors.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } catch (e) {
                          return Container(
                            child: Center(
                                child: Text("Oops. Something went wrong",
                                    style: GoogleFonts.openSansCondensed())),
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
