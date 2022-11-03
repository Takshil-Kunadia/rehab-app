import 'package:flutter/material.dart';
class greetingWidget extends StatelessWidget{
  const greetingWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "Good Morning Danish",
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}