
import 'dart:ffi';

import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _q = [
    Question( question: 'You can lead a cow down stairs but not up stairs.', answer: true),
    Question( question: 'Approximately one quarter of human bones are in the feet.', answer: false),
    Question( question: 'A slug\'s blood is green.', answer: true),
    Question( question: 'Some cats are actually allergic to humans', answer: true),
    Question( question: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', answer: true),
    Question( question: 'It is illegal to pee in the Ocean in Portugal.', answer: true),
    Question( question: 'No piece of square dry paper can be folded in half more than 7 times.', answer: false),
    Question( question: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', answer: true),
    Question( question: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', answer: false),
    Question( question: 'The total surface area of two human lungs is approximately 70 square metres.', answer: true),
    Question( question: 'Google was originally called \"Backrub\".', answer: true),
    Question( question: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', answer: true),
    Question( question: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', answer: true),
  ];

  bool nextQuestion() {
    if(_questionNumber < _q.length -1) {
      _questionNumber++;
      return true;
    }
    return false;
  }
  String getQuestionText() {
    return _q[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _q[_questionNumber].answer;
  }

  int resetQuestionQuiz() {
    return _questionNumber = 0;
  }
}