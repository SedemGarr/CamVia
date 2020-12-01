import 'dart:math';
import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_app/Services/auth.dart';
import 'package:trivia_app/Services/databaseservice.dart';
import 'package:trivia_app/Services/globalvariables.dart';
import 'package:trivia_app/Widgets/loading.dart';
import 'homepage.dart';
import 'signinpage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Random randomClipper = new Random();
    randomNumberClipper = randomClipper.nextInt(clippers.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingPage()
        : SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: AnimatedText(
                              alignment: Alignment.center,
                              speed: Duration(milliseconds: 1000),
                              controller: AnimatedTextController.loop,
                              displayTime: Duration(milliseconds: 1500),
                              wordList: ['CamVia!', 'Trivia', 'built with', 'Flutter'],
                              textStyle: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.15,
                                  fontWeight: FontWeight.w700),
                              onAnimate: (index) {
                                print("Animating index:" + index.toString());
                              },
                              onFinished: () {
                                print("Animtion finished");
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    style: GoogleFonts.chilanka(
                                        color: Colors.black),
                                    keyboardType: TextInputType.emailAddress,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: themeColorDeep),
                                      ),
                                      hintText: 'Email',
                                      hintStyle: GoogleFonts.openSansCondensed(
                                          color: themeColorDeep),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter your Email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val.trim());
                                    },
                                  ),
                                  SizedBox(height: 10.0),
                                  TextFormField(
                                    style: GoogleFonts.chilanka(
                                        color: Colors.black),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: themeColorDeep),
                                      ),
                                      hintText: 'Your Username',
                                      hintStyle: GoogleFonts.openSansCondensed(
                                          color: themeColorDeep),
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter your Username'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => username = val.trim());
                                    },
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          style: GoogleFonts.chilanka(
                                              color: Colors.black),
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: themeColorDeep),
                                            ),
                                            hintText: 'Your Password',
                                            hintStyle:
                                                GoogleFonts.openSansCondensed(
                                                    color: themeColorDeep),
                                          ),
                                          obscureText: true,
                                          validator: (val) => val.length < 6
                                              ? 'Your password must be at least six characters long'
                                              : null,
                                          onChanged: (val) {
                                            setState(
                                                () => password = val.trim());
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          style: GoogleFonts.chilanka(
                                              color: Colors.black),
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: themeColorDeep),
                                            ),
                                            hintText: 'Re-enter Your Password',
                                            hintStyle:
                                                GoogleFonts.openSansCondensed(
                                                    color: themeColorDeep),
                                          ),
                                          obscureText: true,
                                          validator: (val) => val != password
                                              ? 'Passwords do not match'
                                              : null,
                                          onChanged: (val) {
                                            setState(
                                                () => password1 = val.trim());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlineButton(
                                        borderSide: BorderSide(
                                          color: themeColor,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignInPage()));
                                          error = " ";
                                        },
                                        child: Text('Login',
                                            style:
                                                GoogleFonts.openSansCondensed(
                                                    fontSize: 15,
                                                    color: themeColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        color: themeColorDeep,
                                        child: Text(
                                          'Sign up',
                                          style: GoogleFonts.openSansCondensed(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() => loading = true);
                                            dynamic result = await _auth
                                                .signUpWithEmailAndPassword(
                                                    email, password);
                                            if (result == null) {
                                              setState(() {
                                                loading = false;
                                                error =
                                                    'Oops! Please check your credentials';
                                              });
                                            }
                                            if (result != null) {
                                              // update firestore
                                              await DatabaseService()
                                                  .updateUserData(
                                                      username, userid, score);
                                              setState(() {
                                                loading = false;
                                                error = "";
                                              });
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage()));
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    error,
                                    style: GoogleFonts.openSansCondensed(
                                        color: themeColorDeep, fontSize: 14.0),
                                  ),
                                  SizedBox(height: 12.0),
                                ],
                              ),
                            ),
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
