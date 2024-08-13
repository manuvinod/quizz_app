import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Qizz page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Wizard Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WizardPage(),
    );
  }
}

class WizardPage extends StatefulWidget {
  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  List<Widget> _pages = [
    WizardStepPage(title: "QuizzOO", content: "Welcome to Quizzoo Quiz app, where knowledge meets excitement! Get ready to embark on a thrilling journey of trivia challenges and fun-filled learning experiences.", lottieanimation: "assets/images/Animation - 1713940000735.json"),
    WizardStepPage(title: "ABOUT US", content: "Discover the story behind Quizzoo Quiz app! Our journey began with a passion for trivia and a commitment to creating an engaging platform for knowledge seekers worldwide. From our dedicated team of developers to our community of enthusiastic players,", lottieanimation: "assets/images/Animation - 1713940000735.json"),
    WizardStepPage(title: "Welcome", content: "Welcome to the heart of Quizzoo Quiz app, where every tap opens the door to a world of trivia excitement! Join our vibrant community of knowledge enthusiasts and embark on a journey filled with fun challenges, intriguing facts, and endless entertainment. Let's dive in and explore together!", lottieanimation: "assets/images/Animation - 1713940000735.json")
  ];

  void _nextPage() {
    if (_currentPageIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex++;
      });
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => QizzPage(),));
    }
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
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
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: _pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 58.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (_currentPageIndex>0)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[700],
                          minimumSize: Size(100, 70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: _previousPage,
                      child: Icon(
                        Icons.arrow_circle_left,color: Colors.black,
                        size: 50,)
                  ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[700],
                        minimumSize: Size(100, 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: _nextPage,
                    child:  Icon(
                        Icons.arrow_circle_right,color: Colors.black, size: 50)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WizardStepPage extends StatelessWidget {
  final String title;
  final String content;
  final String lottieanimation;

  const WizardStepPage({Key? key, required this.title, required this.content,required this.lottieanimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Lottie.asset(lottieanimation,height: 300,width: 300),
          SizedBox(height: 20,),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            content,
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFF4E342E)
            ),
          ),
        ],
      ),
    );
  }
}