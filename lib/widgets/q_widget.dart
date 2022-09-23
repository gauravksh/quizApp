import 'package:flutter/material.dart';

// ignore: camel_case_types
class queWidget extends StatelessWidget {
  const queWidget(
      {super.key,
      required this.cur,
      required this.tot,
      required this.q,
      required this.points});
  final int points;
  final int cur;
  final int tot;
  final String q;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question $cur/$tot",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  "Score : $points",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.black),
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Text(
              // ignore: unnecessary_string_interpolations
              "$q",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ));
  }
}
