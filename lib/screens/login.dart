import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/screens/register_business.dart';
import 'package:firebase_conn/screens/searchcard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';
import 'emptyscreen.dart';
import 'logonscreen.dart';
import 'logonscreenresult.dart';

// import 'anothersearch.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _auth = FirebaseAuth.instance;
  // TextEditingController email = new TextEditingController();
  // TextEditingController password = new TextEditingController();
  late String email;
  late String password;
  // get firestore => null;

  // get searchController => null;

  @override
  Widget build(BuildContext context) {
    // TextEditingController searchController2;
    return
        // SingleChildScrollView(
        //   child:
        Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "email"),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "password"),
                  onChanged: (value) {
                    password = value;
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    // Map<String, dynamic> data = {
                    //   "f01email": email.text,
                    //   "f02password": password.text
                    // };
                    // FirebaseFirestore.instance.collection("register").add(data);
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      if (user != null) {
                        print('Hello uid: ' + user.user!.uid);
                        print(user);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Logonlanding(
                              searchstr: user.user!.uid.toString(),
                              // searchstr: searchstring.text,
                            ),
                          ),
                        );
                        // Navigator.pushNamed(context, AddBusDetails); // NEED TO LEARN ABOUT NAMED ROUTES
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("LOGIN"),
                ),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
