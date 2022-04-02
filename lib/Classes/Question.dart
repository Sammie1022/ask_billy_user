class Question {
  final String question;
  final String answer;
  final String image_path;

  Question(
      {required this.question, required this.answer, required this.image_path});

  factory Question.fromJSON(Map<String, dynamic> data) {
    return Question(
        question: data['question'],
        answer: data['answer'],
        image_path: data['image_path']);
  }
}
