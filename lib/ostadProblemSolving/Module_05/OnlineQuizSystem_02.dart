import 'dart:io';

class Question{
  String?  questionText;
  List option =[];
  int ? correctOptionIndex;
  int? points;
  Question({required this.questionText,required this.option,required this.correctOptionIndex,required this.points,});
}
class Quiz{
  int totalscore=0;
  int passingscore=2;
  List<Question> questions =[];
  void addQuestion(Question question){
    questions.add(question);
  }
  Future<void>  quizQuestion()async {
    Future.delayed(Duration(seconds: 02));
    questions=[
      Question(
          questionText:"What is the capital of Bangadesh",
          option:["Dhaka","Rajshahi","Chitagang","Barishal"],
          correctOptionIndex:0,
          points:5),
    ];
  }
  void startQuiz(){
    int total =0;
    for (var question in questions){
      print(question.questionText);
      for (int i=0; i<question.option.length;i++){
        print("${i+1}.${question.option[i]}");
      }
      int? userAnswer = int.tryParse(stdin.readLineSync()!);
      if(userAnswer! - 1 ==question.correctOptionIndex){
        total += question.points!;
      }
    }
    print("Your total score is : $total");
  }
  void retakeQuiz() async {
    do {
      await quizQuestion();
      startQuiz();
    } while (totalscore < passingscore);
    print('Congratulations! You passed the quiz.');
  }
}
Future<void> main() async {

  Quiz quiz = Quiz();
  await quiz.quizQuestion();
  quiz.retakeQuiz();
}