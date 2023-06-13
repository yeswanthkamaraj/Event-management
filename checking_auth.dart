// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'department_dashboard.dart';
import 'login_page.dart';

class checking_auth extends StatelessWidget {
  const checking_auth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyHomePagaa(title: '');
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
