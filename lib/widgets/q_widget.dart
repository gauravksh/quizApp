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
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      child: Container(
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
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "Score : $points",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  "$q",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
