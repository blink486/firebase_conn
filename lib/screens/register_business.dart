import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/screens/searchsat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'anothersearch.dart';

class AddBusDetails extends StatefulWidget {
  const AddBusDetails({Key? key}) : super(key: key);

  @override
  _AddBusDetailsState createState() => _AddBusDetailsState();
}

class _AddBusDetailsState extends State<AddBusDetails> {
  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  TextEditingController postcode = new TextEditingController();
  TextEditingController email = new TextEditingController();

  TextEditingController business_name = new TextEditingController();
  TextEditingController business_desc = new TextEditingController();
  TextEditingController service_radius = new TextEditingController();
  TextEditingController searchstring = new TextEditingController();
  TextEditingController password = new TextEditingController();

  get firestore => null;

  get searchController => null;

  // final _auth = FirebaseAuth.instance;
  // FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final currUser = FirebaseAuth.instance.currentUser!.email;
      if (currUser != null) {
        String msg = "Hello";
        print(" $msg   $currUser");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController searchController2;
    return
        // SingleChildScrollView(
        //   child:
        Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(hintText: "name"),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: surname,
                  decoration: InputDecoration(hintText: "surname"),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: postcode,
                  decoration: InputDecoration(hintText: "postcode"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(hintText: "email"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(hintText: "dfdf"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: business_name,
                  decoration: InputDecoration(hintText: "business name"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: business_desc,
                  decoration: InputDecoration(hintText: "business desc"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: service_radius,
                  decoration: InputDecoration(hintText: "service radius"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: searchstring,
                  decoration: InputDecoration(
                      hintText: "Search String",
                      fillColor: Colors.green,
                      filled: true),
                ),
                SizedBox(height: 10.0),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GetDataS(
                                  searchstr: searchstring.text,
                                )));
                  },
                  child: Text("Pass Search String Path->2"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () {
                    Map<String, dynamic> data = {
                      // "f01name": name.text,
                      // "f02surname": surname.text,
                      // "f03postcode": postcode.text,
                      // "f04business_name": business_name.text,
                      // "f05business_desc": business_desc.text,
                      // "f06service_radius": service_radius.text
                      "f01name": name.text,
                      "f02surname": surname.text,
                      "f03postcode": postcode.text,
                      "f04business_name": business_name.text,
                      "f05business_desc": business_desc.text,
                      "f06service_radius": service_radius.text,
                      "f07email": email.text,
                      "f08password": password.text
                    };
                    FirebaseFirestore.instance.collection("register").add(data);
                  },
                  child: Text("Submit New Business User"),
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
