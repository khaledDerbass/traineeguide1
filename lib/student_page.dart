//import 'dart.html';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class myStudent extends StatefulWidget {
  const myStudent({Key? key}) : super(key: key);

  @override
  _myStudentState createState() => _myStudentState();
}

class _myStudentState extends State<myStudent> {

  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(32.5568, 35.8469);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: null,
            backgroundColor: Colors.transparent,
            leading: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'student1');
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black45,
              ),
            )),
       // backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Text(
                    '',
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
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 35,
                  right: 35,
                ),
                child: Row(
                  children: [
                    SizedBox(height: .02),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize:  Size(MediaQuery.of(context).size.width * 0.365, MediaQuery.of(context).size.height * 0.08),
                            minimumSize:  Size(MediaQuery.of(context).size.width * 0.365, MediaQuery.of(context).size.height * 0.08),

                            primary: Colors.black,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Check-IN '),
                              Icon(
                                Icons.add_location,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                maximumSize:  Size(MediaQuery.of(context).size.width * 0.365, MediaQuery.of(context).size.height * 0.08),
                                minimumSize:  Size(MediaQuery.of(context).size.width * 0.365, MediaQuery.of(context).size.height * 0.08),
                                primary: Colors.black,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Check-OUT '),
                                  Icon(
                                    Icons.add_location_alt_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
