import 'package:flutter/material.dart';
import 'package:cs_310_proje/pages/welcomepage.dart';
import 'package:cs_310_proje/pages/login.dart';
import 'package:cs_310_proje/pages/signin.dart';


void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => Welcome(),
    '/login': (context) => LoginScreen(),
    '/signup': (context) => SignUp(),
  },
));


