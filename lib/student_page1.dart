import 'package:flutter/material.dart';

class myStudent1 extends StatefulWidget {
  const myStudent1({Key? key}) : super(key: key);

  @override
  _myStudentState1 createState() => _myStudentState1();
}


class _myStudentState1 extends State<myStudent1> {

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
                      'Trainee Guide',
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
                      SizedBox(height: 150.0),
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
                                  Text('Attendance Check '),
                                  Icon(
                                    Icons.location_searching,
                                    color: Colors.red,
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