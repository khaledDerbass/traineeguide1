import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class myRegister extends StatefulWidget
{
  const myRegister({Key? key}) : super(key: key);

  @override
  _myRegisterState createState() => _myRegisterState();
}
final _auth = FirebaseAuth.instance;

class _myRegisterState extends State<myRegister> {
  late String email;
  late String password;
  bool showSpinner = false;
  String dropdownvalue='STS-Specialized Technical Services';
  // List of items in our dropdown menu
  var items = [
    'STS-Specialized Technical Services',
    'Estarta Solutions ',
    'IRIS Technology ',
  ];
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
          appBar: AppBar(
              elevation: null,
              backgroundColor: Colors.transparent,
              leading: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
              )),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register as\nSTUDENT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),

                ],
              ),



              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'Username',
                        ),
                      ),
                      SizedBox(height: 30.0),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                          //Do something with the user input.
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',

                            ),
                          ),

                      SizedBox(height: 30.0),
                      TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                          //Do something with the user input.
                        },
                        decoration: InputDecoration(

                          hintText: 'Phone',
                      )),

                      SizedBox(height: 30.0),
                      TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                        hintText: 'Password',
                          ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(height: 30.0),
                      DropdownButton(
                        // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          value: dropdownvalue,
                         // Array list of items
                               items: items.map((String items) {
                                      return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {
                                    setState(() {
                                    dropdownvalue = newValue!;
                                    });
                            }

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
                                setState(() {
                            showSpinner = true;
                            });
                            try {
                            final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                            if (newUser != null) {
                              Navigator.pushNamed(context, 'student');

                            }
                            } catch (e) {
                            print(e);
                            }
                            setState(() {
                            showSpinner = false;
                            });
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('REGISTER'),
                                  Icon(
                                    Icons.content_paste_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
],),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'supervisor');
                            },
                                child: Text(
                              'Register as SUPERVISOR',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
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