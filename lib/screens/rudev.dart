import 'package:flutter/material.dart';
import 'package:quizapp/screens/result.dart';
import '../constants.dart';
import '../models/question.dart';
import '../widgets/q_widget.dart';
import '../widgets/option_card.dart';
import '../widgets/next_button.dart';

class Q4 extends StatefulWidget {
  const Q4({super.key, required this.name});
  final String? name;
  @override
  State<Q4> createState() => _Q4State();
}

class _Q4State extends State<Q4> {
  List<Question> questions = [
    Question(id: 1, q: "Who is president ?", op: {
      "It's me": false,
      "Sai Prasad": false,
      "idk": false,
      "Gautam": true
    }),
    Question(id: 2, q: "When does cycle 1 end", op: {
      "idc": false,
      "who knows": false,
      "28th of sept": true,
      "2028": false
    }),
    Question(id: 3, q: "How do I join dev/track?", op: {
      "fill the form smh": false,
      "dont be like siddz": false,
      "lookout for upcoming announcements regarding new applications": true,
      "Wish upon a star": false
    }),
    Question(
        id: 4,
        q: "How many tracks do we have?",
        op: {"5": true, "1": false, "69": false, "around 1000": false}),
    Question(id: 5, q: "What's the endgame of the club?", op: {
      "CV go brr": false,
      "Learn and teach stuff": false,
      "Both": true,
      "Timepass": false
    })
  ];
  int score = 0;
  void nextQuestion() {
    if (isClicked) {
      if (i == questions.length - 1) {
        showDialog(
            context: context,
            builder: (context) => Result(
                  total: questions.length,
                  score: score,
                  name: widget.name,
                ));
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
      backgroundColor: const Color(0xFF2f3136),
      appBar: AppBar(
        title: Text(
          "Welcome ${widget.name}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
        backgroundColor: const Color(0xFF864CBF),
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
