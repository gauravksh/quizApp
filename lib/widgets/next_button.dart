import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextQuestion});
  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextQuestion,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/buttonBG.png"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        // decoration: BoxDecoration(
        //     color: const Color(0xFF2196F3),
        //     borderRadius: BorderRadius.circular(10)),
        child: const Text(
          "Next",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
