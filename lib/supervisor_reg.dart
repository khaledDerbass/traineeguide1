import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mySupervisor extends StatefulWidget {
  const mySupervisor({Key? key}) : super(key: key);

  @override
  _mySupervisorState createState() => _mySupervisorState();
}

class _mySupervisorState extends State<mySupervisor> {
  final _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.reference();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/login.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
              elevation: null,
              backgroundColor: Colors.transparent,
              leading: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black45,
                ),
              )),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: Text(
                      'Register as Supervisor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Employee ID',
                          fillColor: Colors.transparent,
                          filled: true,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Email',
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Phone',
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Password',
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size(170.0, 90.0),
                              minimumSize: const Size(170.0, 60.0),
                              primary: Colors.black,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () async {
                              //Navigator.pushNamed(context, 'supervisor1');
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser != null) {
                                  databaseReference
                                      .child("Users")
                                      .child(_auth.currentUser!.uid)
                                      .set({
                                    'id': _auth.currentUser!.uid,
                                    'role_id': 2,
                                    'email': email,
                                    'password': password,
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (_) => const AlertDialog(
                                            title: Text('Alert'),
                                            content: Text(
                                                'Your Account has been created successfully'),
                                          ));
                                  Navigator.pushNamed(context, 'supervisor1');
                                }
                              } catch (e) {
                                print(e);
                                showDialog(
                                    context: context,
                                    builder: (_) => const AlertDialog(
                                          title: Text('Alert'),
                                          content: Text('Error during signup'),
                                        ));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('REGISTER'),
                                Icon(
                                  Icons.content_paste_rounded,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
