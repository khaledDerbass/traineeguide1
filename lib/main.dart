import 'package:flutter/material.dart';
import 'package:traineeguide/resetpass.dart';
import 'package:traineeguide/student_page.dart';
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
      'student': (context) => myStudent()
      }));
      }
    /*
    Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
    _markers.clear();
    for (final office in googleOffices.offices) {
    final marker = Marker(
    markerId: MarkerId(office.name),
    position: LatLng(office.lat, office.lng),
    infoWindow: InfoWindow(
    title: office.name,
    snippet: office.address,
    ),
    );
    _markers[office.name] = marker;
    }
    });
    }

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
    appBar: AppBar(
    title: const Text('Google Office Locations'),
    backgroundColor: Colors.green[700],
    ),
    body: GoogleMap(
    onMapCreated: _onMapCreated,
    initialCameraPosition: const CameraPosition(
    target: LatLng(0, 0),
    zoom: 2,
    ),
    markers: _markers.values.toSet(),
    ),
    ),
    );
    }
      },
    ),
  );
}*/

