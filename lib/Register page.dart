import 'package:flutter/material.dart';

import 'Login page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Q2.png"),alignment: Alignment.topCenter,scale:3),
          color: Colors.white,
        ),
        child: Column(
          children:<Widget> [
            SizedBox(height: 250,),
            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight: Radius.circular(40))
              ),
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  Text("Creat New Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyan),),
                  Row(
                    children: [
                      SizedBox(width: 110,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.facebook_outlined,size: 50,color: Colors.blue,)),
                      SizedBox(width: 10,),
                      Image(image: AssetImage("assets/images/Twitter.png"),height: 40,width: 40,),
                      SizedBox(width: 10,),
                      TextButton(onPressed: (){}, child: Text("G+",style: TextStyle(color: Colors.red,fontSize: 40,fontWeight: FontWeight.bold),))
                    ],
                  ),
                  Text("or use your email account",style: TextStyle(color: Colors.black,fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.cyan,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                )

                            ),
                          ),
                        ),Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.cyan,
                                hintText: "Name",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
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
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                )

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(
                        backgroundColor: Colors.blue[100],
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(image: AssetImage("assets/images/sms.png"),height: 100,width: 100,),
                            Text("Thank you for your\n""      Resgistration",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                            Text("we're glad you're here!\n before you start QuizzOO,\nwe just sent you the email cofromation"
                              ,style:TextStyle(color: Colors.white,fontSize: 20),)
                          ],
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: ElevatedButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Text("Send email conformation"),
                            )),
                          )
                        ],
                      );
                    });
                  },style: ElevatedButton.styleFrom(primary: Colors.blue[700],shape:RoundedRectangleBorder(),minimumSize: Size(350, 50)),
                      child: Text("Registerd",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Text("Already have an account?",style: TextStyle(color: Colors.black,fontSize: 18),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                        }, child: Text("Login here",style: TextStyle(color: Colors.green[600],fontSize: 18),))
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
