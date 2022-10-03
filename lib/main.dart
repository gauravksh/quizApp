import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/provider/google_sign_in.dart';
import 'package:quizapp/screens/page1.dart';
// import 'package:quizapp/screens/welcome.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: const MaterialApp(
        title: 'QuizApp',
        debugShowCheckedModeBanner: false,
        home: Page1(),
      ),
    );
  }
}
