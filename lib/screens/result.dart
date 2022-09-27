import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.total, required this.score});
  final int score;
  final int total;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Score",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              minRadius: 40,
              backgroundColor: Color(0xFF864CBF),
              child: Text(
                "$score/$total",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
