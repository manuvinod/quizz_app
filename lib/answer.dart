import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  const Answer({required this.optionals ,required this.alphatext,required this.questiontext,required this.answerblockcolor,required this.Answercolor,required this.disabled,});
  final VoidCallback optionals;
  final String alphatext;
  final String questiontext;
  final Color answerblockcolor;
  final Color Answercolor;
  final bool disabled;

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled ? null : widget.optionals,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            color: widget.answerblockcolor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: Colors.blue,
                width: 2
            )
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 15,
              child: Text(
                widget.alphatext,
              ),
            ),
          ),
          title: Text(
            widget.questiontext,
            style: TextStyle(
              color: widget.Answercolor,
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
