import 'package:flutter/material.dart';
import 'package:quizapp/screens/homepage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                "Welcome to Dev/Track's Quiz",
                style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Enter your Name to continue",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Nickname",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 30),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color(0xFF864CBF),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Text(
                    "Let's Start FFS",
                  ),
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}