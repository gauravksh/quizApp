import 'package:flutter/material.dart';
import 'package:quizapp/screens/result.dart';
import '../constants.dart';
import '../models/question.dart';
import '../widgets/q_widget.dart';
import '../widgets/option_card.dart';
import '../widgets/next_button.dart';


class Revaq extends StatefulWidget {
  const Revaq({super.key, required this.name});
  final String name;
  @override
  State<Revaq> createState() => _revaqState();
}
// ignore: camel_case_types
class _revaqState extends State<Revaq> {
  List<Question> questions = [
    Question(id: 1, q: "Where is the Kalpana Chawla seminar hall present ?", op: {
      "Swami Vivekananda Block": false,
      "Applied Sciences Block": false,
      "Vishweshwarya Block": false,
      "C V Raman Block": true
    }),
    Question(
        id: 2,
        q: "A place where most of the people sing,dance,play, and spend their time?",
        op: {"At class": false, "Roll me": false, "Saugandhika": true, "Kuvempu Auditorium": false}),


    Question(id: 3, q: "What is the name of the CSE club?", op: {
      "FORCE": false,
      "FACIT": false,
      "FACE": true,
      "DONT KNOW ": false
    }),

    Question(
        id: 4,
        q: "The name of the seminar hall present in Swami Vivekananda Block ?",
        op: {"APJ abdul Kalam Hall": false, "Library seminar hall": false, "Kalpana Chawla Hall": false, "Justice Hegde Hall": true}),
    
    Question(
        id: 5,
        q: "Gate closes at",
        op: {"8:10": false, "Never": true, "Always": false, "8:35": false})
  ];
  int score = 0;
  void nextQuestion() {
    if (isClicked) {
      if (i == questions.length - 1) {
        showDialog(
            context: context,
            builder: (context) =>
                Result(total: questions.length, score: score, name: widget.name,));
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
      backgroundColor: Color(0xFF2f3136),
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
