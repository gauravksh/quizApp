import 'package:flutter/material.dart';
import 'package:quizapp/screens/result.dart';
import '../constants.dart';
import '../models/question.dart';
import '../widgets/q_widget.dart';
import '../widgets/option_card.dart';
import '../widgets/next_button.dart';


class Hack extends StatefulWidget {
  const Hack({super.key, required this.name});
  final String name;
  @override
  State<Hack> createState() => _HackState();
}
class _HackState extends State<Hack> {
  List<Question> questions = [
    Question(id: 1, q: "Who is the CEO of Google?", op: {
      "Larry Page": false,
      "Sundar Pichai": true,
      "Sergey Brin": false,
      "Tim Cook": false
    }),
    Question(
        id: 2,
        q: "Who is the founder of Amazon?",
        op: {"Jeff Bezos": true, "Elon Musk": false, "Bill Gates": false, "Steve Jobs": false}),
    Question(id: 3, q: "Which of the following company wasn't acquired by Byjus?", op: {
      "Aakash Educational Services Limited": false,
      "WhiteHat Jr": false,
      "ALLEN Career Institute": true,
      "Toppr learning": false
    }),
    Question(
        id: 4,
        q: "BharatPe was founded by?",
        op: {"Aman Gupta": false, "Peyush Bansal": false, "Vineeta Singh": false, "Ashneer Grover": true}),
    Question(
        id: 5,
        q: "Nano car was introduced by which automobile gaint in india?",
        op: {"Maruthi Suzuki": false, "Tata motors": true, "Mahindra": false, "Toyota": false})
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
