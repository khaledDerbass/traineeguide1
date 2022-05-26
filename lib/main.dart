import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
  runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'Trainee Guide',
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
/*
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);
  @override
  _SplashscreenState createState() => _SplashscreenState();
}


class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                const SizedBox(
                  height: 30,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  )
                )
              ],
            )
        )
        children: [
          MaterialApp(

          debugShowCheckedModeBanner: false,
          initialRoute: 'login',
          title: 'Trainee Guide',
          home: splashscreen(
              seconds: 3,
              navigateAfterSeconds:'login',
              title: new Text(
                'Trainee Guide',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
              image: Image.asset('assets/logo.png'),
              photoSize: 100.0,
              backgroundColor: Colors.white,
              styleTextUnderTheLoader: new TextStyle(),
              loaderColor: Colors.lightGreen
          ),
          routes: {
            'login': (context) => myLogin(),
            'register': (context) => myRegister(),
            'forgot': (context) => resetPassword(),
            'student': (context) => myStudent(),
            'student1': (context) => myStudent1(),
            'supervisor': (context) => mySupervisor(),
            'supervisor1': (context) => mySupervisor1(),
          }),
        ]);



  }

}*/
/*
 MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'Trainee Guide',
      home: SplashScreen(
          seconds: 3,
          navigateAfterSeconds:'login',
          title: new Text(
              'Trainee Guide',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white),
          ),
          image: Image.asset('assets/logo.png'),
          photoSize: 100.0,
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          loaderColor: Colors.lightGreen
      ),
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
*/

