
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'Login page.dart';
import 'Qustion.dart';
import 'Result.dart';
import 'model.dart';
import 'answer.dart';
import 'package:image_picker/image_picker.dart';

class QizzPage extends StatefulWidget {
  const QizzPage({super.key});

  @override
  State<QizzPage> createState() => _QizzPageState();
}

class _QizzPageState extends State<QizzPage> {
  final question=AnswerList.questions;
  int indexselected=-1;
  bool result=false;
  Color inactiveColor=Colors.white;
  Color activeColor=Colors.cyan;
  int currentIndex=0;
  int score=0;
  int timer = 10; // Timer in seconds
  late Timer countdownTimer;
  File? _image;
 @override
 void initState() {
   super.initState();
   startTimer();
 }
  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("Timer value: ${this.timer}");
      if (this.timer == 0) {
        setState(() {
          scoreupdates();
          currentindex();
        });
      } else {
        setState(() {
        this.timer--;
        });
      }
    });
  }
  void scoreupdates(){
    final answerList=question[currentIndex]["answers"] as List<Map<String, Object>>;
    if(indexselected!=-1){
      if(answerList[indexselected!]['answer']==true)
        {
          setState(() {
            score+=1;
          });
        }
    }
    print(score);
  }
  void currentindex(){
    countdownTimer.cancel();
    setState(() {
      currentIndex+=1;
      indexselected = -1;
    });
    if(currentIndex==question.length)
      {
        int scoreres=score;
        currentIndex=0;
        score=0;
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
          scoreresult:scoreres,
          totalques:question.length
        ),
        ));
      } else {
      // Restart the timer for the next question
      setState(() {
        timer = 10;
      });
      startTimer();
    }
  }
  final picker=ImagePicker();
  Future<void> pickImage(ImageSource source)async{
    final pickedFile=await picker.pickImage(source:source);
    setState(() {
      if(pickedFile!=null){
        _image=File(pickedFile.path);
      }else{
        print("image not selected");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Row(
            children: [
              Image.asset("assets/images/Q2.png", height: 50, width: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text("uizzOO", style: TextStyle(
                    color: Colors.cyan, fontWeight: FontWeight.bold),),
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
      drawer: Drawer(
        backgroundColor:Colors.indigo[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: _image != null ? FileImage(_image!) : null,
                          child: _image == null ? Icon(Icons.person, size: 50) : null,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            pickImage(ImageSource.gallery);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28,),
                  Text("VAISHNAV AP",style: TextStyle( color: Colors.white)),
                  Text("manuvinod80@gmail.com",style: TextStyle( color: Colors.white))
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.cyan),
              title: Text('My Profile',style: TextStyle( color: Colors.white),),
              onTap: () {
                // Add your item 2 action here
              },
            ),
            ListTile(
                leading: Icon(Icons.home, color: Colors.cyan),
              title: Text('Home',style: TextStyle( color: Colors.white),),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.cyan),
              title: Text('Notification',style: TextStyle( color: Colors.white),),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.score, color: Colors.cyan),
              title: Text('Top Score',style: TextStyle( color: Colors.white),),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.cyan),
              title: Text('Settings',style: TextStyle( color: Colors.white),),
              onTap: () {
              },
            ),
            SizedBox(height: 280,),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.cyan),
              title: Text('Log Out',style: TextStyle( color: Colors.white),),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Text(
                "Question 0${currentIndex + 1}/${question.length}"
                , style: TextStyle(
                  color: Colors.red, fontSize: 19, fontWeight: FontWeight.w500
              ),),
            ),
            SizedBox(height: 30,),
            Questions(questionText: question[currentIndex]["questionText"].toString()),
            SizedBox(height: 30,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: (question[currentIndex]['answers'] as List<Map<String, Object>>).length,
                itemBuilder: (BuildContext context, int index) {
                  final AnswerList = question[currentIndex]["answers"] as List<Map<String, Object>>;
                  return Answer(optionals: () {
                    setState(() {
                      indexselected = index;
                    });
                  },
                      alphatext: AnswerList[index]['Alpha'].toString(),
                      questiontext: AnswerList[index]["Text"].toString(),
                      answerblockcolor: (indexselected == index)  ? (AnswerList[index]['answer'] == true ? Colors.green : Colors.red) : inactiveColor,
                      Answercolor: (indexselected == index) ? Colors.white : Colors.cyan,
                    disabled: indexselected!=-1,
                  );
                }),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ElevatedButton(onPressed: () {
                setState(() {
                scoreupdates();
                currentindex();
                  indexselected = -1;
                });
              },
                  style: ElevatedButton.styleFrom(primary: Colors.blue[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(370, 50),
                      elevation: 10),
                  child: Text("Next", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),)),
            )
          ],
        ),
      ),
    );
  }}