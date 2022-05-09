import 'package:flutter/material.dart';
import 'package:traineeguide/resetpass.dart';
import 'package:traineeguide/student_page.dart';
import 'package:traineeguide/student_page1.dart';
import 'package:traineeguide/student_reg.dart';
import 'package:traineeguide/supervisor_reg.dart';

import 'login.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'Attendance Guide',
      home:myLogin(),
      routes: {
      'login': (context) => myLogin(),
      'register': (context) => myRegister(),
      'forgot': (context) => resetPassword(),
      'supervisor': (context) => mySupervisor(),
      'student': (context) => myStudent(),
      'student1': (context) => myStudent1()

      }));
      }