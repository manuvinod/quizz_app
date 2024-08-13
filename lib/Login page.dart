import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Qizz page.dart';
import 'Register page.dart';
import 'Splash.dart';
import 'forgot password.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  bool isChecked=false;
  bool obcr=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 75,),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset("assets/images/Q2.png",height:200,width: 200,),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.cyan,
                      hintText: "Enter your login ID",
                      suffixIcon: Icon(Icons.pending),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (value){
                      if(value==null ||value.isEmpty){
                        return "please enter your login id";
                      }else if(value=="manuvinod@123"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Splash(),));
                      }return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.cyan,
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            obcr=!obcr;
                          });
                        }, icon: Icon(obcr? Icons.visibility :Icons.visibility_off)),
                      hintText: "Enter your paswword",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    validator: (value){
                      if(value==null ||value.isEmpty){
                        return "please enter your password";
                      }else if(value=="12345"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>QizzPage(),));
                      }return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked, onChanged: (value) {
                      setState(() {
                        isChecked=value!;
                      });
                    },),
                    Text("Remember me",),
                    SizedBox(width: 130,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPswrd(),));
                    }, child: Text("forgot password?",))
                  ],
                ),
                SizedBox(height: 80,),
                ElevatedButton(
                    onPressed: (){
                  if (_formKey.currentState!.validate()){
                    String username= _usernameController.text;
                    String password=_passwordController.text;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Splash(),));
                  }
                },style: ElevatedButton.styleFrom(primary: Colors.blue[700],shape:RoundedRectangleBorder(),minimumSize: Size(350, 50)),
                    child: Text("Get Start",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Text("Don't have an account?",style: TextStyle(fontSize: 18),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      }, child: Text("Registerd here",style: TextStyle(color: Colors.green[600],fontSize: 18),))
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text("Go to Online Link"),
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJRccbPXePhZRJGFBEvrTwuIelYkOmMf24yg&usqp=CAU",width: 150,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
