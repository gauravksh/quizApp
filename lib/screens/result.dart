import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:quizapp/screens/category.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.total, required this.score, required this.name});
  final int score;
  final int total;
  final String name;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF2f3136),
      content: Padding(
        padding: const EdgeInsets.all(45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Score",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              minRadius: 40,
              backgroundColor: const Color(0xFF2196F3),
              child: Text(
                "$score/$total",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Well done",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
            ),
             // ignore: prefer_const_constructors
             SizedBox(height: 40),
             InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(name: name,)))
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Color(0xFF2196F3),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: const Text(
                      "Try Again",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
