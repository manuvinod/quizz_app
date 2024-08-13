import 'dart:async';

import 'package:flutter/material.dart';

import 'Lotti animation.dart';
import 'Qizz page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WizardPage(),));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
        body:Center(
          child: Container(
              height: 100,
              width: 180,
              child: Row(
                children: [
                  Image.asset("assets/images/Q2.png"),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text("uizzOO",style: TextStyle(color: Colors.cyan,fontSize: 20,fontWeight: FontWeight.bold),),
                  )
                ],
              )
          ),
        )
    );
  }
}
