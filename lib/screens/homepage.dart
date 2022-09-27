import 'package:flutter/material.dart';
import 'package:quizapp/screens/result.dart';
import '../constants.dart';
import '../models/question.dart';
import '../widgets/q_widget.dart';
import '../widgets/option_card.dart';
import '../widgets/next_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name});
  final String name;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> questions = [
    Question(id: 1, q: "Why is AGJ Gae ?", op: {
      "bcuz": false,
      "Sai forced him": false,
      "idk": false,
      "Life is not daijobu": true
    }),
    Question(
        id: 2,
        q: "2 + 2 = ?",
        op: {"8": false, "69": false, "ur mom": true, "30": false}),
    Question(id: 3, q: "How do I join dev/track?", op: {
      "fill the form smh": false,
      "dont be like siddz": false,
      "lookout for upcoming announcements regarding new applications": true,
      "so yea": false
    }),
    Question(
        id: 4,
        q: "this question 4",
        op: {"4": true, "four": true, "3 + 1": true, "5 - 1": true})
  ];
  int score = 0;
  void nextQuestion() {
    if (isClicked) {
      if (i == questions.length - 1) {
        showDialog(
            context: context,
            builder: (context) =>
                Result(total: questions.length, score: score));
      } else {
        setState(() {
          i++;
          isClicked = false;
        });
      }
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(content: Text("Please choose one of the options")));
    // }
  }

  void checkAnswer(bool val) {
    if (val) {
      score++;
    }
    setState(() {
      isClicked = true;
    });
  }

  bool isClicked = false;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Welcome ${widget.name}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: Color(0xFF864CBF),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            queWidget(
                cur: i + 1,
                tot: questions.length,
                q: questions[i].q,
                points: score),
            // const Divider(),
            // const Divider(),
            const SizedBox(
              height: 25,
            ),
            for (int idx = 0; idx < 4; idx++)
              GestureDetector(
                onTap: () => checkAnswer(questions[i].op.values.toList()[idx]),
                child: OptionCard(
                  option: questions[i].op.keys.toList()[idx],
                  clr: isClicked
                      ? questions[i].op.values.toList()[idx] == true
                          ? correct
                          : incorrect
                      : def,
                ),
              )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: NextButton(nextQuestion: nextQuestion),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
