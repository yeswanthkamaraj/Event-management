// ignore_for_file: unnecessary_import, implementation_imports, camel_case_types, avoid_print, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class workshop_page extends StatefulWidget {
  const workshop_page({Key? key}) : super(key: key);

  @override
  State<workshop_page> createState() => _workshop_pageState();
}

class _workshop_pageState extends State<workshop_page> {
  final department = TextEditingController();
  final Titlee = TextEditingController();
  final venue = TextEditingController();
  final dateandtime = TextEditingController();
  final mode = TextEditingController();
  final registerlink = TextEditingController();
  final address = TextEditingController();
  final mailid = TextEditingController();
  final contactnumber = TextEditingController();
  // final work5 = TextEditingController();
  // final work6 = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  getValues() {
    print(department.text);
    print(Titlee.text);
    print(venue.text);
    print(dateandtime.text);
    print(mode.text);
    print(registerlink.text);
    print(address.text);
    print(mailid.text);
    print(contactnumber.text);
    // print(work5);
    //  print(work6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('WORKSHOP REGISTRATION'),
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return " field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            department.text = value!;
                          },
                          controller: department,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Department',
                            hintText: '',
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            Titlee.text = value!;
                          },
                          controller: Titlee,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                            hintText: '',
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            venue.text = value!;
                          },
                          controller: venue,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'venue',
                            hintText: '',
                          )),
                      SizedBox(height: 10),
                      TextField(
                        controller: dateandtime,
                        //editing controller of this TextField
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            //icon of text field
                            labelText: "Enter Date" //label text of field
                            ),
                        readOnly: true,
                        //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              dateandtime.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            mode.text = value!;
                          },
                          controller: mode,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mode',
                            hintText: 'Enter Your Name',
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            registerlink.text = value!;
                          },
                          controller: registerlink,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Registration Link',
                            hintText: '',
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            address.text = value!;
                          },
                          maxLines: 4,
                          controller: address,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                            hintText: '',
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "field cannot be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            mailid.text = value!;
                          },
                          controller: mailid,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Mail id',
                            hintText: '',
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value!.length == 0) {
                              return "field be empty";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            contactnumber.text = value!;
                          },
                          keyboardType: TextInputType.phone,
                          controller: contactnumber,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'contact Number',
                            hintText: '',
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        height: 50.0,
                        minWidth: double.infinity,
                        elevation: 0,
                        color: Colors.indigo,
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            FirebaseFirestore.instance.collection('event').add({
                              'Department': department.text,
                              'Title': Titlee.text,
                              'venue': venue.text,
                              'Dateandtime': dateandtime.text,
                              'Mode': mode.text,
                              'registerlink': registerlink.text,
                              'address': address.text,
                              'mailid': mailid.text,
                              'contactnumber': contactnumber.text,

                              /* 'uid': currentUser.currentUser!.uid,
                              'Register_On': FieldValue.serverTimestamp(),
                              'stage': stage.toString(),
                              'completed_level': _currentValue.toString(),*/
                            }).whenComplete(() {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text("Conference registered"),
                                  content:
                                      const Text("Successfully Registered"),
                                  actions: <Widget>[
                                    MaterialButton(
                                      color: Colors.indigo,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Done",
                                          style:
                                              TextStyle(color: Colors.white)),
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
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
