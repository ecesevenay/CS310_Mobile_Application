import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cs_310_proje/pages/welcomepage.dart';
import 'package:cs_310_proje/pages/login.dart';
import 'package:cs_310_proje/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => WalkThrough(),
    '/welcome': (context) => Welcome(),
    '/login': (context) => LoginScreen(),
    '/signup': (context) => SignupPage(),
  },
));

class WalkThrough extends StatefulWidget {

  @override
  _WalkThroughState createState() => _WalkThroughState();

  Future checkFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);

    Navigator.pop(context);
    if (_introSeen) {
      Navigator.pushNamed(context, '/welcome');
    } else {
      await prefs.setBool('intro_seen', true);
      Navigator.pushNamed(context, '/');
    }
  }
}

class _WalkThroughState extends State{

  int currentPage=0;
  int lastPage=3;

  List <String> title =[
    'WELCOME',
    'INTRO',
    'PROFILE',
    'CONTENT',
  ];

  List <String> heading = [
    'About suAcademia',
    'Sign up',
    'Creating profile',
    'Chat,Subscribe,Explore !'
  ];

  List <String> image_url= [
    'https://img.freepik.com/free-vector/account-concept-illustration_114360-399.jpg?size=338&ext=jpg',
    'https://www.gecoitaly.it/images/login-img.jpg',
    'https://www.gecoitaly.it/images/register-img.jpg',
    'https://img.freepik.com/free-vector/newsletter-illustration-concept_114360-767.jpg?size=338&ext=jpg',

  ];

  List <String> captions= [
    'A social environment among Sabancı University students and graduates! ',
    'To explore suAcademia, sign up with only a username and password!',
    'Only requisite is to be a graduate or current student at Sabancı University!',
    'Start chat with students and graduates, subscribe channels!',


  ];


  void nextPage() {
    if (currentPage< lastPage)
    {
        setState((){
          currentPage +=1;
        });
    }
    else if (currentPage == 3)
    {
      Navigator.pushNamed(context, '/welcome');
    }
  }

  void prevPage(){
    if (currentPage > 0)
      {
        setState(() {
          currentPage -=1;
      });
    }

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          title[currentPage],
          style:TextStyle(
            color:Colors.black,
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child:Padding(
                padding:const EdgeInsets.symmetric(vertical:16),
                child:Text(
                  heading[currentPage],
                  style:TextStyle(
                    fontSize:32,
                    fontWeight: FontWeight.bold,
                    color:  Colors.black,
                    letterSpacing:-1,
                  ),

                ),

              ),

            ),
            Container(
              height: 280,
              child:CircleAvatar(
                backgroundColor: const Color(0xFF229A98),
                radius: 140,
                backgroundImage: NetworkImage(image_url[currentPage]),
              )
            ),
            Center(
              child:Text(
                captions[currentPage],
                style:TextStyle(
                  fontSize:24,
                  letterSpacing: -1,
                  color: Colors.black,



                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
              child: Container(
                height: 80,
                child: Row(
                  children: [
                    OutlinedButton(
                      onPressed:prevPage,
                      child: Text(
                        'Previous',
                        style:TextStyle(
                            color: Colors.black,
                            ),
                      ),
                    ),

                    Spacer(),

                    Text(
                      '${currentPage+1}/${lastPage+1}',
                      style:TextStyle(
                        color: Colors.black,
                      )
                      ,
                    ),

                    Spacer(),

                    OutlinedButton(
                      onPressed:nextPage,
                      child: Text(
                        'Next',
                        style:TextStyle(
                            color: Colors.black,
                        ),
                      ),
                    ),

                  ],
                ),

              ),

            ),
          ]
        ),

      ),
    );
  }
}
