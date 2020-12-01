import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/Services/globalvariables.dart';

import 'homepage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", isDark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Select Theme",
          style: GoogleFonts.chilanka(
            fontWeight: FontWeight.bold,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        actions: [
          isDark
              ? Icon(
                  FontAwesomeIcons.solidSun,
                  color: themeColor.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                )
              : Icon(
                  FontAwesomeIcons.solidMoon,
                  color: themeColor.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                ),
          Switch(
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
                saveTheme();
                print(isDark);
              });
            },
            activeTrackColor: themeColorDeep,
            activeColor: themeColorDeep,
            inactiveThumbColor: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
            inactiveTrackColor: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Stack(
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
              Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.05, 20, 10),
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                                child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: colors.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      themeColor = colors[index];
                                      color = colors[index].toString();
                                      print(color);
                                      saveColor();
                                      getColor();
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: CircleAvatar(
                                      backgroundColor: colors[index],
                                      child: CircleAvatar(
                                        backgroundColor:
                                            themeColor.toString() ==
                                                    colors[index].toString()
                                                ? isDark
                                                    ? Colors.grey[900]
                                                    : Colors.white
                                                : colors[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ))
                          ],
                        ),
                      ),
                      color == "random"
                          ? FlatButton(
                              onPressed: () {
                                // setState(() {
                                //   color = "";
                                // });
                              },
                              color: themeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text('Random',
                                  style: GoogleFonts.openSansCondensed(
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black)))
                          : OutlineButton(
                              onPressed: () {
                                setState(() {
                                  color = "random";
                                  saveColor();
                                  getColor();
                                });
                              },
                              color: themeColor,
                              borderSide: BorderSide(
                                color: themeColor,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                'Random',
                                style: GoogleFonts.openSansCondensed(
                                    color:
                                        isDark ? Colors.black : Colors.white),
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Random will choose a random new colour at each app launch',
                        style: GoogleFonts.openSansCondensed(
                            color: isDark ? Colors.black : Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
