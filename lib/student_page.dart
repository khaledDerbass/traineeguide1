import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class myStudent extends StatefulWidget {
  const myStudent({Key? key}) : super(key: key);

  @override
  _myStudentState createState() => _myStudentState();
}
class _myStudentState extends State<myStudent> {
  GoogleMapController? _controller;
  late Location currentLocation=Location();
  Set<Marker> _markers={};


  void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){

      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
    });
  }

  @override
  void initState(){
    super.initState();
    setState(() {
      getLocation();
    });
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
          zoomControlsEnabled: false,
          initialCameraPosition:CameraPosition(
            target: LatLng(48.8561, 2.2930),
            zoom: 12.0,
          ),
          onMapCreated: (GoogleMapController controller){
            _controller = controller;
          },
          markers: _markers,
        ) ,
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
                          onPressed: () {          getLocation();
                          },
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
                              onPressed: () {          getLocation();
                              },
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
]
        ),
      ),
    );
  }
}
