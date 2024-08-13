import 'package:flutter/material.dart';

import 'Login page.dart';

class ForgotPswrd extends StatefulWidget {
  const ForgotPswrd({super.key});

  @override
  State<ForgotPswrd> createState() => _ForgotPswrdState();
}

class _ForgotPswrdState extends State<ForgotPswrd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80,),
            Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.yellow[100],
                border: Border.all(
                  color: Colors.red
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(" 'No worries! If you've forgotten your password, "
                    "simply enter your email address,phoneNumber and Login id(Lohin id not manditory) below, and we'll send you a link to reset your password.'",style: TextStyle(color: Colors.red),),
              ),
            ),
            SizedBox(height: 40,),
            Center(child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Image.asset("assets/images/Q2.png",height: 80,width: 80,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text("uizzOO",style: TextStyle(color: Colors.cyan,fontSize: 25,fontWeight: FontWeight.bold),),
                ),
              ],
            )),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.cyan,
                  hintText: 'Enter your Email-ID',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.cyan,
                    hintText: 'PhoneNumber',
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.cyan,
                    hintText: 'Enter your login ID',
                    suffixIcon: Icon(Icons.pending),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  backgroundColor:  Colors.blue[100],
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/sms.png",height: 80,width: 80,),
                      Text("your new Password will send to your Email\n             Dont Share with anyone!"),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      }, child: Text("Back to login page")),
                    )
                  ],
                );
              });
            },style: ElevatedButton.styleFrom(primary: Colors.blue[700],shape:RoundedRectangleBorder(),minimumSize: Size(350, 50)),
                child: Text("Re-Send Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 40,),
            Text("Go to Online Link"),
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJRccbPXePhZRJGFBEvrTwuIelYkOmMf24yg&usqp=CAU",width: 150,)
          ],
        ),
      ),
    );
  }
}
