import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/Models/user.dart';
import 'globalvariables.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      userid = authResult.user.uid;
      prefs.setString('Firebase ID', userid);
      error = " ";
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // get uid and save locally
      FirebaseUser firebaseUser = authResult.user;
      userid = authResult.user.uid;
      prefs.setString('Firebase ID', userid);
      error = " ";
      score = 0;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      categories = [
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
      score = null;
      difficulty = null;
      username = null;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Firebase ID', null);
      prefs.setString('difficulty', null);
      prefs.setInt('score', null);
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
