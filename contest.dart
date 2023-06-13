// ignore_for_file: implementation_imports, unnecessary_import, camel_case_types, avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class contest_page extends StatefulWidget {
  const contest_page({Key? key}) : super(key: key);

  @override
  State<contest_page> createState() => _contest_pageState();
}

class _contest_pageState extends State<contest_page> {
  final fName = TextEditingController();
  final lName = TextEditingController();
  final subject = TextEditingController();
  final className = TextEditingController();
  final phoneNumber = TextEditingController();
  final cont1 = TextEditingController();
  final cont2 = TextEditingController();
  final cont3 = TextEditingController();
  final cont4 = TextEditingController();
  final cont5 = TextEditingController();
  final cont6 = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  getValues() {
    print(fName.text);
    print(lName.text);
    print(subject.text);
    print(className.text);
    print(phoneNumber.text);
    print(cont1);
    print(cont2);
    print(cont3);
    print(cont4);
    print(cont5);
    print(cont6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('CONTEST REGISTRATION'),
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
                          controller: fName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Department',
                            hintText: '',
                          )),
                    ),
                    Container(
                      width: 350,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                          controller: lName,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Tilte',
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
                          controller: cont1,
                          autocorrect: true,
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
                          controller: cont4,
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
                          controller: cont5,
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
                          controller: cont6,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact Number',
                            hintText: 'Enter Your Name',
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
                      'Member_2': cont1.text,
                      'Member_3': cont2.text,
                      'Member_4': cont3.text,
                      'Member_5': cont4.text,
                      'Member_6': cont5.text,
                      'Member_7': cont6.text,
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
        ));
  }
}
