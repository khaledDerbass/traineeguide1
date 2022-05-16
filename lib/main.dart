import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:traineeguide/resetpass.dart';
import 'package:traineeguide/student_page.dart';
import 'package:traineeguide/student_page1.dart';
import 'package:traineeguide/student_reg.dart';
import 'package:traineeguide/supervisor_page.dart';
import 'package:traineeguide/supervisor_reg.dart';
import 'login.dart';


Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'Trainee Guide',
      home:myLogin(),
      routes: {
      'login': (context) => myLogin(),
      'register': (context) => myRegister(),
      'forgot': (context) => resetPassword(),
      'student': (context) => myStudent(),
      'student1': (context) => myStudent1(),
      'supervisor': (context) => mySupervisor(),
      'supervisor1': (context) => mySupervisor1(),
      }));
}