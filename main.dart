// ignore_for_file: prefer_const_constructors_in_immutables, unused_import, prefer_const_constructors, use_key_in_widget_constructors

import 'package:ecomerceapp/checking_auth.dart';
import 'package:ecomerceapp/studashboard.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'department_dashboard.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'KSRCT';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        home: checking_auth(),//MyHomepage
        color: Colors.indigo,
        debugShowCheckedModeBanner: false);
  }
}


/*
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() {
runApp(gfgApp()); //MaterialApp
}

MaterialApp gfgApp() {
return MaterialApp(
	home: Scaffold(
	appBar: AppBar(
		title: const Text("KSRCT"),
		actions: <Widget>[
		IconButton(
			icon: const Icon(Icons.comment),
			tooltip: 'Comment Icon',
			onPressed: () {},
		), //IconButton
		IconButton(
			icon: const Icon(Icons.settings),
			tooltip: 'Setting Icon',
			onPressed: () {},
		), //IconButton
		], //<Widget>[]
		backgroundColor: Colors.greenAccent[400],
		elevation: 50.0,
		leading: IconButton(
		icon: const Icon(Icons.menu),
		tooltip: 'Menu Icon',
		onPressed: () {},
		),
		systemOverlayStyle: SystemUiOverlayStyle.light,
	), //AppBar
	body: const Center(
		child: Text(
		"Geeksforgeeks",
		style: TextStyle(fontSize: 24),
		), //Text
	), //Center
	
 drawer: Drawer(  
        child: ListView(  
          // Important: Remove any padding from the ListView.  
          padding: EdgeInsets.zero,  
          children: <Widget>[  
            UserAccountsDrawerHeader(  
              accountName: Text("Abhishek Mishra"),  
              accountEmail: Text("abhishekm977@gmail.com"),  
              currentAccountPicture: CircleAvatar(  
                backgroundColor: Colors.orange,  
                child: Text(  
                  "A",  
                  style: TextStyle(fontSize: 40.0),  
                ),  
              ),  
            ),  
            ListTile(  
              leading: Icon(Icons.home), title: Text("Home"),  
              onTap: () {  
                Navigator.pop(context);  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.settings), title: Text("Settings"),  
              onTap: () {  
                Navigator.pop();  
              },  
            ),  
            ListTile(  
              leading: Icon(Icons.contacts), title: Text("Contact Us"),  
              onTap: () {  
                Navigator.pop();  
              },  
            ),  
          ],  
        ),  
      ),  
    )  //Scaffold
  );


}*/
