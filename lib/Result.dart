import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'Login page.dart';
class ResultPage extends StatefulWidget {
  const ResultPage({required this.scoreresult,required this.totalques});
  final int scoreresult;
  final int totalques;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Row(
            children: [
              Image.asset("assets/images/Q2.png",height: 50,width: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text("uizzOO",style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                backgroundColor:  Colors.blue[100],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Logout your Account ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                actions: [
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      }, child: Text("Log out")),
                      SizedBox(width: 30,),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("Cancel")),
                    ],
                  )
                ],
              );
            });
          }, child: Text("Logout?",style: TextStyle(
              color: Colors.blue[700]
          ),))
        ],
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80,),
            Text("Your Score",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            SizedBox(height: 60,),
            new CircularPercentIndicator(radius: 130,
            lineWidth: 14,
              percent: widget.scoreresult/widget.totalques,
              center: new Text('${((widget.scoreresult/widget.totalques)*100).toStringAsFixed(1)}%',style: TextStyle(
                  fontSize: 50,fontWeight: FontWeight.bold
              ),),
              backgroundColor: Colors.grey,
              progressColor: Colors.cyan,

            ),
            SizedBox(height: 50,),
            Text('correct Answer:${widget.scoreresult}',
            style: TextStyle(fontSize: 30,color: Colors.cyan,fontWeight: FontWeight.bold),
            ),
            Text('Wrong Answer:${widget.totalques-widget.scoreresult}',
              style: TextStyle(fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50,),
            Container(
              width: 370,
              height: 55,
              child: ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },style: ElevatedButton.styleFrom(primary: Colors.blue[700],minimumSize: Size(370, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),elevation: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt,color: Colors.white,size: 40,),
                      Text('Re Test',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                    ],
                  ),),
            )
          ],
        ),
      ),
    );
  }
}
