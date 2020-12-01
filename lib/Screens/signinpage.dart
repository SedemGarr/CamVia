import 'dart:math';
import 'package:animated_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_app/Services/auth.dart';
import 'package:trivia_app/Services/databaseservice.dart';
import 'package:trivia_app/Services/globalvariables.dart';
import 'package:trivia_app/Widgets/title.dart';
import 'signuppage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthService _auth = AuthService();

  @override
  void initState() {
    Random randomClipper = new Random();
    randomNumberClipper = randomClipper.nextInt(clippers.length);
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    Expanded(child: TitleWidget()),
                  ],
                ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
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
                                      hintText: 'Email',
                                      hintStyle: GoogleFonts.openSansCondensed(
                                          color: themeColorDeep),
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Please enter your email address'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => email = val.trim());
                                    },
                                  ),
                                  SizedBox(height: 20.0),
                                  TextFormField(
                                    style: GoogleFonts.chilanka(
                                        color: Colors.black),
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.openSansCondensed(
                                          color: themeColorDeep),
                                    ),
                                    validator: (val) => val.length < 6
                                        ? 'Your password must be at least six characters long'
                                        : null,
                                    obscureText: true,
                                    onChanged: (val) {
                                      setState(() => password = val.trim());
                                    },
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      OutlineButton(
                                        borderSide: BorderSide(
                                          color: themeColorDeep,
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpPage()));
                                          error = " ";
                                        },
                                        child: Text('Sign up',
                                            style:
                                                GoogleFonts.openSansCondensed(
                                                    fontSize: 15,
                                                    color: themeColorDeep,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ),
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        color: themeColor,
                                        child: Text(
                                          'Login',
                                          style: GoogleFonts.openSansCondensed(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() => loading = true);
                                            dynamic result =
                                                await _auth.signInEmailAndPass(
                                                    email, password);
                                            if (result == null) {
                                              setState(() {
                                                loading = false;
                                                error =
                                                    'Oops! Please check your credentials';
                                              });
                                            }
                                            if (result != null) {
                                              Phoenix.rebirth(context);
                                              DatabaseService()
                                                  .getUserDetails();
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
