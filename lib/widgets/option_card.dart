import 'package:flutter/material.dart';
// import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.option, required this.clr});

  final String option;
  // final bool isClicked;
  final Color clr;
  // final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: clr,
      child: ListTile(
        hoverColor: Colors.blueGrey,
        enableFeedback: true,
        title: Text(
          option,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
