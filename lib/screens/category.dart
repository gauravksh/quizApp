import 'package:flutter/material.dart';
import 'package:quizapp/screens/homepage.dart';
import 'package:quizapp/screens/moquestions.dart';
import 'package:quizapp/screens/questionset3.dart';
import 'package:quizapp/screens/rudev.dart';

class Category extends StatelessWidget {
   const Category({super.key,required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
  
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      backgroundColor: Color(0xFF2f3136),
      // backgroundColor: Colors.white,
      body : Column(
        
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Text("Select Category",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            
            FloatingActionButton.large(/**shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),**/onPressed :() =>  {Navigator.push(context,MaterialPageRoute(builder:((context) =>  Q4(name: name ) )))}, 
             child : const Text("What is Dev/track",style: TextStyle(color: Colors.white)),
            ),
            FloatingActionButton.large(/**shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),**/onPressed :() =>  {Navigator.push(context,MaterialPageRoute(builder:((context) =>  Hack(name: name ) )))},
             child : const Text("The tech world",style: ( TextStyle(color: Colors.white)) )
            ),
            FloatingActionButton.large(/**shape:BeveledRectangleBorder(borderRadius: BorderRadius.zero)**/onPressed :() =>  {Navigator.push(context,MaterialPageRoute(builder:((context) =>  HomePage(name: name ) )))},
             child : const Text("Iykyk",style: TextStyle(color: Colors.white)),
            ),
            FloatingActionButton.large(onPressed :() =>  {Navigator.push(context,MaterialPageRoute(builder:((context) =>  Revaq(name: name ) )))}, 
             child : const Text("Reva",style: TextStyle(color: Colors.white)),
            )
      ],)
      
    );
  }
}
