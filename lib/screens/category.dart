import 'package:flutter/material.dart';
import 'package:quizapp/screens/homepage.dart';
import 'package:quizapp/screens/questionset3.dart';
import 'package:quizapp/screens/rudev.dart';

class Category extends StatelessWidget {
   const Category({super.key,required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
  
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      backgroundColor: Colors.white,
      body : Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Text("Select Category",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            
            FloatingActionButton.large(onPressed :() =>  {Navigator.push(context,MaterialPageRoute(builder:((context) =>  Q4(name: name ) )))}, backgroundColor: const Color(0xFF864CBF),
             child : const Text("What is Dev/track",style: TextStyle(color: Colors.black)),
            ),
            FloatingActionButton.large(onPressed :() =>  {Navigator.push(context,MaterialPageRoute(builder:((context) =>  Hack(name: name ) )))},backgroundColor: const Color(0xFF864CBF),
             child : const Text("The tech world",style: ( TextStyle(color: Colors.black)) )
            ),
            FloatingActionButton.large(onPressed :() =>  {Navigator.push(context,MaterialPageRoute(builder:((context) =>  HomePage(name: name ) )))}, backgroundColor: const Color(0xFF864CBF),
             child : const Text("Iykyk",style: TextStyle(color: Colors.black)),
            )

      ],)
      
    );
  }
}
