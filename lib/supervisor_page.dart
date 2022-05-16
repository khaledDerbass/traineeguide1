import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

late User loggedinUser;

class mySupervisor1 extends StatefulWidget {
  const mySupervisor1({Key? key}) : super(key: key);

  @override
  _mySupervisorState1 createState() => _mySupervisorState1();
}


class _mySupervisorState1 extends State<mySupervisor1> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
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
                      top: 60.0,
                    ),
                    child: Text(
                      'History of students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.25,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize:  Size(MediaQuery.of(context).size.width * 0.700, MediaQuery.of(context).size.height * 0.50),
                                minimumSize:  Size(MediaQuery.of(context).size.width * 0.700, MediaQuery.of(context).size.height * 0.08),
                                primary: Colors.black,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, 'student');
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Training letter'),
                                  Icon(
                                    Icons.content_paste_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              )),


                        ],

                      ),

                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize:  Size(MediaQuery.of(context).size.width * 0.700, MediaQuery.of(context).size.height * 0.50),
                                minimumSize:  Size(MediaQuery.of(context).size.width * 0.700, MediaQuery.of(context).size.height * 0.08),
                                primary: Colors.black,
                                shape: StadiumBorder(),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, 'student1');
                              },
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Monthly Reports'),
                                  Icon(
                                    Icons.content_paste_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),),
            ],


          ),
        ),
      ),
    );
  }
}