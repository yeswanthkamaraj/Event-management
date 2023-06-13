// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import, implementation_imports
import 'package:flutter/src/foundation/key.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/framework.dart';

class conference_page extends StatefulWidget {
  conference_page({Key? key}) : super(key: key);

  @override
  State<conference_page> createState() => _conference_pageState();
}

class _conference_pageState extends State<conference_page> {
  final _formkey = GlobalKey<FormState>();
  final fName = TextEditingController();
  final lName = TextEditingController();
  final subject = TextEditingController();
  final className = TextEditingController();
  final phoneNumber = TextEditingController();
  final conf1 = TextEditingController();
  final conf2 = TextEditingController();
  final conf3 = TextEditingController();
  final conf4 = TextEditingController();
  final conf5 = TextEditingController();
  final conf6 = TextEditingController();

  getValues() {
    print(fName.text);
    print(lName.text);
    print(subject.text);
    print(className.text);
    print(phoneNumber.text);
    print(conf1.text);
    print(conf2.text);
    print(conf3);
    print(conf4);
    print(conf5);
    print(conf5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('CONFERENCE REGISTRATION'),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: lName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Department',
                          hintText: 'Enter Your Name',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: fName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                          hintText: '',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: subject,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Venue',
                          hintText: '',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: className,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Date and Time',
                          hintText: '',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mode',
                          hintText: '',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        maxLines: 4,
                        controller: conf1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          hintText: '',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: conf4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Registration link',
                          hintText: '',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: conf5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mail id',
                          hintText: '',
                        )),
                  ),
                  Container(
                    width: 350,
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                        controller: conf6,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contact Number',
                          hintText: '',
                        )),
                  ),
                ],
              ),
            ),
            MaterialButton(
              height: 50.0,
              minWidth: double.infinity,
              elevation: 0,
              color: Colors.indigo,
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  FirebaseFirestore.instance.collection('event').add({
                    'Team_Name': fName.text,
                    'Project_Name': lName.text,
                    'Project_Dis': subject.text,
                    'Leader_Name': className.text,
                    'Member_1': phoneNumber.text,
                    'Member_2': conf1.text,
                    'Member_3': conf2.text,
                    'Member_4': conf3.text,
                    'Member_5': conf4.text,
                    'Member_6': conf5.text,
                    'Member_7': conf6.text,
                    /* 'uid': currentUser.currentUser!.uid,
                            'Register_On': FieldValue.serverTimestamp(),
                            'stage': stage.toString(),
                            'completed_level': _currentValue.toString(),*/
                  }).whenComplete(() {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Conference registered"),
                        content: const Text("Successfully Registered"),
                        actions: <Widget>[
                          MaterialButton(
                            color: Colors.indigo,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text("Done",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  });
                } else {
                  CircularProgressIndicator();
                }
              },
              child: Text(
                'Register Now',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }
}
