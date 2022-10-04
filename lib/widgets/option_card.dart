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
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Card(
        color: clr,
        margin: const EdgeInsets.all(5),
        child: ListTile(
          hoverColor: Colors.blueGrey,
          enableFeedback: true,
          title: Text(
            option,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
