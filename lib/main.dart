import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage()),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  _alert(context) {
    Alert(
        type: AlertType.info,
        context: context,
        title: "TERMINO EL QUIZZ",
        desc: "Felicitaciones has completado el Quiz! Ni idea de como has salido "
              "pq no voy a programar esa parte pero se te enviará un ramo de rosas y una cartita de feliz cumpleaños.",
        buttons: [
          DialogButton(
              onPressed: () => resetQuiz(context),
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0),
              ]),
              child: const Text(
                "Terminar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
          )
        ],
    ).show();
  }
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  //
  // List<bool> answers = [
  //   true,
  //   false,
  //   true,
  // ];
  void answerCheck(bool a) {
    if (quizBrain.getQuestionAnswer() == a) {

      scoreKeeper.add(
        const Icon(color: Colors.green, Icons.check),
      );
    } else {
      scoreKeeper.add(const Icon(color: Colors.red, Icons.close));
    }
    quizBrain.nextQuestion() ? null : _alert(context);
    // questionNumber < quizBrain.getQuestionsLength() -1 ? questionNumber++ : resetQuiz();
  }

  void resetQuiz(context) {
    setState(() {
      scoreKeeper = [];
      quizBrain.resetQuestionQuiz();
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  answerCheck(true);
                });
              },
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  answerCheck(false);
                });
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
