// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// function to trigger app build

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 21, 86, 24),
        */
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 43, 243),
        title: Text('KSRCT-DEPT DASBOARD'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint("Product searched"),
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => debugPrint("Notifications list"),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 55, 36, 228),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 73, 38, 232)),
                accountName: Text(
                  "K S R C T",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(""),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 46, 33, 223),
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.dd-TZILsP4rtHJ_qTcDb4wHaG9?w=162&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
                  // child: image(
                  //  "A",
                  // style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  //), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('HISTORY'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("event").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      var data = snapshot.data!.docs[i];

                      return Column(children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 300.0,
                                width: 350.0,
                                decoration: BoxDecoration(
                                  color: Colors.indigo[100],
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Title: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['Title'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Date: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['Dateandtime'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Department: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['Department'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Mode: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['Mode'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "venue: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['venue'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Email: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['mailid'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Contact No: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['contactnumber'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Address: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['address'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Link: ",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    data['registerlink'],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        )
                      ]);
                    });
              } else {
                return Text('');
              }
            }),
      ),
    );
  }
}
