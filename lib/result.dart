import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;
  const Result(this.resultScore, this.resetQuiz, {Key key}) : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 5) {
      resultText = 'Go! Get some knowledge';
      print(resultScore);
    } else if (resultScore <= 10 && resultScore > 5) {
      resultText = 'Your need to work hard!';
      print(resultScore);
    } else if (resultScore <= 20 && resultScore > 10) {
      resultText = 'Pretty Likeable!';
      print(resultScore);
    } else {
      resultText = 'You are awesome!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'Score' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: const Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetQuiz(),
          ),
        ],
      ),
    );
  }
}
