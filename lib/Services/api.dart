import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trivia_app/Models/Trivia.dart';

class TriviaAPI {
  int numberOfQuestions;
  String difficulty = '';
  int category = 0;
  String url;

  TriviaAPI(int numberOfQuestions, String difficulty, int category) {
    this.numberOfQuestions = numberOfQuestions;
    this.difficulty = difficulty;
    this.category = category;
  }

  getQuestionsRandom() async {
    url =
        "https://opentdb.com/api.php?amount=$numberOfQuestions&category=$category&difficulty=$difficulty";

    await http.get(url).then((res) {
      // triviaObjects = [];
      var response = jsonDecode(res.body);
      createResultsAndAddToArray(response);
      print(triviaObjects[0].incorrectAnswers);
      return triviaObjects;
    });
  }
}
