import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:trivia_app/Models/Trivia.dart';
import 'package:trivia_app/Services/globalvariables.dart';
import 'gamelogic.dart';

class DatabaseService {
  final CollectionReference triviaCollection =
      Firestore.instance.collection('Users');

  Future updateUserData(String username, String userid, int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    score = 0;
    prefs.setInt('score', score);
    prefs.setString('username', username);
    return await triviaCollection.document(userid).setData({
      "username": username,
      "uid": userid,
      "score": score == null ? 0 : score,
      "categories": categories
    }, merge: true);
  }

  Future updateScore(scoreToSend) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    score = prefs.getInt('score');
    int tempScore = score + scoreToSend;
    prefs.setInt('score', tempScore);
    addToCategory();
    await triviaCollection
        .document(userid)
        .setData({'score': tempScore, "categories": categories}, merge: true);
    print(score);
    score = prefs.getInt('score');
    // if (mode == "Quick Quiz") {
    //   if (triviaObjects[triviaIndex].difficulty == "easy") {
    //     prefs.setInt('score', score += 10);
    //     addToCategory();
    //     await triviaCollection.document(userid).setData(
    //         {'score': score += 10, "categories": categories},
    //         merge: true);
    //   }
    //   if (triviaObjects[triviaIndex].difficulty == "medium") {
    //     prefs.setInt('score', score += 20);
    //     addToCategory();
    //     await triviaCollection.document(userid).setData(
    //         {'score': score += 10, "categories": categories},
    //         merge: true);
    //   }
    //   if (triviaObjects[triviaIndex].difficulty == "hard") {
    //     prefs.setInt('score', score += 30);
    //     addToCategory();
    //     await triviaCollection.document(userid).setData(
    //         {'score': score += 10, "categories": categories},
    //         merge: true);
    //   }
    // } else {
    //   prefs.setInt('score', score += roundScore);
    //   addToCategory();
    //   await triviaCollection.document(userid).setData(
    //       {'score': score += roundScore, "categories": categories},
    //       merge: true);
    // }
  }

  Future getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await triviaCollection.document(userid).get().then((document) {
      score = document.data['score'];
      username = document.data['username'];
      categories = document.data['categories'];
    });
    prefs.setInt('score', score);
    prefs.setString("username", username);
  }

  getCategories() async {
    await triviaCollection.document(userid).get().then((document) {
      categories = document.data['categories'];
      username = document.data['username'];
    });
  }

  Future getHighScores() async {
    List userScores1 = [];
    return Firestore.instance
        .collection("Users")
        .orderBy("score")
        .snapshots()
        .listen((result) {
      result.documents.forEach((element) {
        userScores1.add(element);
        //usedNames.add(element.data()["username"].toString());
        //print(usedNames[0]);
      });

      userScores = [];
      userScores = userScores1.reversed.toList();
      userScoresComp = [];
      for (int i = 0; i < userScores.length; i++) {
        userScoresComp.add(userScores[i]["username"]);
      }
      userScores1 = [];
    });
  }
}

getUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userid = prefs.getString('Firebase ID');
  score = prefs.getInt('score');

  try {
    DatabaseService().getCategories();
    DatabaseService().getHighScores();
  } catch (e) {
    DatabaseService().getCategories();
    DatabaseService().getHighScores();
    print(e.toString());
  }
}
