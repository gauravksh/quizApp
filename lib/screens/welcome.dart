import 'package:flutter/material.dart';
import 'package:quizapp/screens/homepage.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  String uname = "User";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          SafeArea(
              child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg2.png"),
                        fit: BoxFit.cover),
                  ),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            "Enter your Name to continue",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            // filled: true,
                            fillColor: Colors.white,
                            hintText: "Nickname",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(199, 255, 255, 255),
                                fontSize: 14),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          onChanged: (value) {
                            uname = value;
                          },
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          name: uname,
                                        )))
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(bottom: 30),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/bg.png"),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: const Text(
                              "Let's Start",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  )))
        ]),
      ),
    );
  }
}
