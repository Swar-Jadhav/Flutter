import 'package:flutter/material.dart';
import 'package:untitled/screens/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {   //build context helps to identify controller to build widgets
    return MaterialApp(
    home: LoginScreen()
    );
        }
}

