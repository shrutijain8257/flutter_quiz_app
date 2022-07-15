import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText':
          'Q1. A widget that allows us to refresh the screen is called?',
      'answers': [
        {'text': 'Stateful Widgets', 'score': 10},
        {'text': 'Statebuild Widgets', 'score': 0},
        {'text': 'Stateless Widgets', 'score': 0},
        {'text': 'All of the above', 'score': 0}
      ],
    },
    {
      'questionText': 'Q2. Which programming language is flutter using?',
      'answers': [
        {'text': 'Javascript', 'score': 0},
        {'text': 'Python', 'score': 0},
        {'text': 'Java', 'score': 0},
        {'text': 'Dart', 'score': 10}
      ],
    },
    {
      'questionText': 'Q3. Who developed Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': 0},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': 0},
        {'text': 'Adobe', 'score': 0}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Quiz App'),
            backgroundColor: Color.fromARGB(0, 119, 142, 185),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totalScore, _resetQuiz),
        ),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
