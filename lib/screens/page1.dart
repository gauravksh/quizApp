import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/category.dart';
import 'package:quizapp/screens/sign_in.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final user = FirebaseAuth.instance.currentUser!;
              return Category(name: user.displayName);
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong!"));
            } else {
              return SignIn();
            }
          }),
    );
  }
}
