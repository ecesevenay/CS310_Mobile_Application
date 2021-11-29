import 'package:cs_310_proje/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:cs_310_proje/utils/color.dart';
import 'package:cs_310_proje/utils/styles.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.white, Colors.white/*AppColors.secondary*/])),
        child:Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            maintainBottomViewPadding: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image(
                    image:AssetImage('assets/cs3103.png'),
                  ),
               ),
                //Spacer(),
                Center(
                  child: Padding(
                    padding: Dimen.regularPadding,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Welcome to ",
                        style: kHeadingTextStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: "suAcademia",
                            style: TextStyle(
                              color:AppColors.maincolor,
                              fontSize: 50.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                              },
                            child:const Text('Signup'),
                            style:ElevatedButton.styleFrom(
                                primary:AppColors.primary,
                                fixedSize: const Size(100, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                )
                            )
                        ),
                      ),

                      SizedBox(width: 30.0,),

                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                              },
                            child:const Text('Login'),
                            style:ElevatedButton.styleFrom(
                                primary:AppColors.primaryDark,
                                fixedSize: const Size(100, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                )
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
    );
  }
}
