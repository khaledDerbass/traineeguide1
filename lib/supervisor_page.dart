import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

late User loggedinUser;

class mySupervisor1 extends StatefulWidget {
  const mySupervisor1({Key? key}) : super(key: key);

  @override
  _mySupervisorState1 createState() => _mySupervisorState1();
}

class _mySupervisorState1 extends State<mySupervisor1> {
  final _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.reference();
  static var result = null;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getStudentsTransactions();
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

  getStudentsTransactions() {
    setState(() {
      isLoading = true;
    });
    databaseReference
        .child("TransactionsHistory")
        .once()
        .then((DataSnapshot snapshot) {
      setState(() {
        isLoading = false;
        result = snapshot.value;
      });
    });
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
                  Navigator.pushNamed(context, 'supervisor');
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
                      top: 10.0,
                    ),
                    child: Text(
                      'History of students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                    child: result != null
                        ? DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Name',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Time',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Type',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ],
                            rows: getRows(),
                          )
                        : const CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> getRows() {
    // NEED FIX
    return List<DataRow>.generate(
        result.length,
        (index) => DataRow(cells: [
              DataCell(Text(
                  result.entries.elementAt(index).value['studentID'] ?? "-")),
              DataCell(
                  Text(result.entries.elementAt(index).value['time'] ?? "-")),
              DataCell(
                  Text(result.entries.elementAt(index).value['type'] ?? "-")),
            ]));
  }
}
