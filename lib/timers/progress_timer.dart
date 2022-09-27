import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/constants.dart';
import '../timers/bar_controller';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF864CBF), width: 3),
        borderRadius: BorderRadius.circular(50)
      ),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),        
        builder: (controlller) {
          
          return Stack(
            children: [
              LayoutBuilder(builder: (context, constraints) => Container(
                width: constraints.maxWidth*controlller.animation.value,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("${(controlller.animation.value * 60).round()}  sec")],
              ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}