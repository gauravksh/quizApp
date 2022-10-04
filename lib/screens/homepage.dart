import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/provider/google_sign_in.dart';
import 'package:quizapp/screens/page1.dart';
import 'package:quizapp/screens/result.dart';
import '../constants.dart';
import '../models/question.dart';
import '../widgets/q_widget.dart';
import '../widgets/option_card.dart';
import '../widgets/next_button.dart';
import "package:firebase_auth/firebase_auth.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name, required this.flag});
  final String? name;
  final bool flag;
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
        op: {"SO?": true, "Welp": true, "Hmm": true, "Ok": true}),
    Question(
        id: 999,
        q: "Which question is this?",
        op: {"5": true, "420": false, "69": false, "999": false})
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
                  flag: widget.flag,
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

  Widget getWidget() {
    if (widget.flag) {
      final user = FirebaseAuth.instance.currentUser!;
      return Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogout();
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const Page1())));
                },
                icon: const FaIcon(
                  FontAwesomeIcons.rightFromBracket,
                  color: Colors.white,
                ))
          ],
        ),
      );
    } else {
      return Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              "Welcome ${widget.name}".toUpperCase(),
              // textAlign: TextAlign.left,
              style: const TextStyle(
                  // fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
      );
    }
  }

  bool isClicked = false;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2f3136),
      // backgroundColor: const Color.fromARGB(255, 168, 111, 225),
      // shadowColor: Colors.transparent,

      body: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg2.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getWidget(),
            // FloatingActionButton.large(onPressed: nextQuestion),
            queWidget(
                cur: i + 1,
                tot: questions.length,
                q: questions[i].q,
                points: score),
            // const Divider(),
            // const Divider(),

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
