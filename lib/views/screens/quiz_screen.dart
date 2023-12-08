
import 'package:flutter/material.dart';
import 'package:ko_ok/models/quiz_model.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [
    Question(text:"les questions de score :Pensez-vous que cette solution contribue à l'objectif du développement durable pour la vie terrestre ?"),
    Question(text:"Pensez-vous que cette solution répond à l'objectif du développement durable en matière de consommation et de production responsables?"),
    Question(text:"Estimez-vous que cette solution contribue à l'objectif du développement durable en favorisant la paix, la justice et des institutions efficaces ?"),
    Question(text:"est ce que le code contient tros des erreurs?"),
  ];

  int score = 0;

  void _submitResult() {
    for (var question in questions) {
      if (question.isYesSelected) {
        score += 10;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        String image;
        if (score == 100) {
          image = "image_100%.png";
        } else if (score >= 75) {
          image = "image_75%.png";
        } else if (score >= 50) {
          image = "image_50%.png";
        } else {
          image = "image_25%.png";
        }

        return AlertDialog(
          title: Text("Quiz Result"),
          content: Column(
            children: [
              Text("Your Score: $score%"),
              Image.asset("assets/$image"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  score = 0;
                  for (var question in questions) {
                    question.isYesSelected = false;
                    question.isNoSelected = false;
                  }
                });
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < questions.length; i++)
                Card(
                  child: ListTile(
                    title: Text(questions[i].text),
                    subtitle: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              questions[i].isYesSelected = true;
                              questions[i].isNoSelected = false;
                            });
                          },
                          child: Text("Oui"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                questions[i].isYesSelected
                                    ? Colors.green
                                    : Colors.grey),
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              questions[i].isYesSelected = false;
                              questions[i].isNoSelected = true;
                            });
                          },
                          child: Text("Non"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                questions[i].isNoSelected
                                    ? Colors.red
                                    : Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitResult,
                child: Text("Submit Result"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}