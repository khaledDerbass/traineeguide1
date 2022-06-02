import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class myLogin extends StatefulWidget {
  const myLogin({Key? key}) : super(key: key);

  @override
  _myLoginState createState() => _myLoginState();
}

final _auth = FirebaseAuth.instance;

class _myLoginState extends State<myLogin> {
  late String email;
  late String password;
  late var userData = null;
  final databaseReference = FirebaseDatabase.instance.reference();
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/register.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset : false,
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(45.0),
                      child: Image.asset('assets/logo.png'),
                      height: 300,
                      width: 350),
                ],
              ),
                 Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35,
                    left: 70,
                    right: 70,
                  ),
                  child: Column(
                    children: [
                      TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                          )),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                          //Do something with the user input.
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your Password',
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize: Size(170.0, 90.0),
                                minimumSize: Size(170.0, 60.0),
                                primary: Colors.black,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (user != null) {
                                    databaseReference
                                        .child("Users")
                                        .child(_auth.currentUser!.uid)
                                        .once()
                                        .then((DataSnapshot snapshot) {
                                      snapshot.value['role_id'] == 1
                                          ? Navigator.pushNamed(
                                              context, 'student1')
                                          : Navigator.pushNamed(
                                              context, 'supervisor1');
                                    });
                                  }
                                } catch (e) {
                                  print(e);
                                  showDialog(
                                      context: context,
                                      builder: (_) => const AlertDialog(
                                            title: Text('Alert'),
                                            content:
                                                Text('Email or Password is incorrect'),
                                          ));
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('LOGIN'),
                                  Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 100.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'forgot');
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
