// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:ecomerceapp/workshop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'conference.dart';
import 'contest.dart';
import 'login_page.dart';
import 'profile_page.dart';

class MyHomePagaa extends StatefulWidget {
  final String title;

  const MyHomePagaa({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePagaa> createState() => _MyHomePagaaState();
}

class _MyHomePagaaState extends State<MyHomePagaa> {
  // logout
  Future<LoginPage> _signOut() async {
    await FirebaseAuth.instance.signOut();
    return new LoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.indigo, title: Text('KSRCT EVENTS')),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            '  ',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.indigo,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(244, 230, 110, 5)),
              accountName: Text("DEPARTMENT DASHBOARD"),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 233, 121, 9),
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.dd-TZILsP4rtHJ_qTcDb4wHaG9?w=162&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Home ',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.white),
              title: const Text(
                ' Workshop',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const workshop_page()),
                );
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                title: const Text(
                  ' Contest ',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const contest_page()),
                  );
                }),
            ListTile(
              leading: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: const Text(
                ' Conference ',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => conference_page()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text(
                'Profile ',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const profile_page()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                'LogOut',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
