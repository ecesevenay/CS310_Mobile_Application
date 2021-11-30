import 'package:flutter/material.dart';
import 'package:cs_310_proje/utils/color.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.primaryDark, AppColors.primary/*AppColors.secondary*/])),
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          //resizeToAvoidBottomPadding: false,
          backgroundColor : Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors:<Color>[AppColors.primaryDark, AppColors.primary]
                )
              ),
            ),
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            leading:
            IconButton( onPressed: (){
              Navigator.pop(context);
              },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text ("Sign up!", style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold, color: AppColors.backgroundColor
                        ),),
                        SizedBox(height: 20,),
                        Text("Create an Account",style: TextStyle(
                          fontSize: 15,
                          fontWeight:FontWeight.bold,
                          color: AppColors.backgroundColor.withOpacity(0.5),
                        ),),
                        SizedBox(height: 30,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: Column(
                        children: [
                          makeInput(label: "Email"),
                          makeInput(label: "Password",obsureText: true),
                          makeInput(label: "Confirm Password",obsureText: true),
                          makeInput(label: "Are you a student or a graduate? (G/S) (G for graduate and S for Student)",obsureText: false),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3,left: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border(
                                bottom: BorderSide(color: Colors.transparent),
                                top: BorderSide(color: Colors.transparent),
                                right: BorderSide(color: Colors.transparent),
                                left: BorderSide(color: Colors.transparent)
                            )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: (){},
                          color: AppColors.textColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Text("Sign Up",style: TextStyle(
                              fontWeight: FontWeight.w800,fontSize: 16, color:Colors.white

                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ", style: TextStyle(
                            color: AppColors.backgroundColor.withOpacity(0.5),
                            fontWeight: FontWeight.w600)

                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text("Login",style: TextStyle(
                              color: AppColors.backgroundColor.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        ),
                      ],
                    )
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}

Widget makeInput({label, obsureText=false}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.backgroundColor
      ),),
      SizedBox( height: 5),
      TextField(
        obscureText: obsureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.backgroundColor)
          ),
        ),
      ),
      SizedBox(height: 30,)

    ],
  );
}
