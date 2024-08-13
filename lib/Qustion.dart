import 'package:flutter/material.dart';
class Questions extends StatelessWidget {
  const Questions({required this.questionText});
final String questionText;
  @override
  Widget build(BuildContext context) {
    return Text(questionText,style: TextStyle(
        fontWeight: FontWeight.bold,color: Colors.black54.withOpacity(0.8),fontSize: 30
    ),);
  }
}
