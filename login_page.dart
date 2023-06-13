// ignore_for_file: use_build_context_synchronously, unused_local_variable, prefer_const_constructors, avoid_print, prefer_is_empty, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'checking_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  //bool loading = false;
  bool _isObscure = true;
  bool isFinished = false;
  bool visible = false;

  Future signIn(String email, String password) async {
    //loading

    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => checking_auth(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: const Text('Invalid Email'),
                  content: Text(e.message.toString()),
                  actions: [
                    MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                );
              });
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: const Text('Invalid Password'),
                  content: Text(e.message.toString()),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ok'),
                    )
                  ],
                );
              });

          print('Wrong password provided for that user.');
        }
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              /*  Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/images/digidoc_logo.png',
                  height: 90,
                ),
              ),*/
              SizedBox(height: 20),
              Text(
                'KSRCT EMS',
                style: GoogleFonts.gugi(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Login Your Account To Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              //email
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Email cannot be empty";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _emailController.text = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              SizedBox(height: 10),

              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: _isObscure,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (!regex.hasMatch(value)) {
                      return ("please enter valid password min. 6 character");
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _passwordController.text = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 10),

              //forgot password
              SizedBox(height: 15),

              //login botton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                    onPressed: () {
                      setState(() {
                        visible = true;
                      });
                      signIn(_emailController.text.trim(),
                          _passwordController.text.trim());
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )),
              ),
            ]))));
  }
}
