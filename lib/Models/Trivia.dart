class Results {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List incorrectAnswers;

  Results(
      {this.category,
      this.type,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});

  Results.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    type = json['type'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    data['incorrect_answers'] = this.incorrectAnswers;
    return data;
  }
}

List<Results> triviaObjects = [];
// to traverse the list
int triviaIndex = 0;

createResultsAndAddToArray(response) {
  if (response['response_code'] == 0) {
    response['results'].forEach((element) {
      element['incorrect_answers'].add(element["correct_answer"]);
      element['incorrect_answers'].sort();
      triviaObjects.add(Results(
          category: element["category"],
          type: element["type"],
          difficulty: element["difficulty"],
          question: element["question"],
          correctAnswer: element["correct_answer"],
          incorrectAnswers: element["incorrect_answers"]));
    });
  }
}
