import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class emptyTab extends StatefulWidget {
  const emptyTab({Key? key}) : super(key: key);

  @override
  _emptyTabState createState() => _emptyTabState();
}

// ignore: camel_case_types
class _emptyTabState extends State<emptyTab> {
  final _auth = FirebaseAuth.instance;
  // To extract specific instance details example:
  // Text(_auth.currentUser!.uid.toString()),
  // Text(_auth.currentUser!.email.toString()),

  // Get FULL Dataset of User instance:
  var firebaseUser = FirebaseAuth.instance.currentUser;

  // Object? get currentUser => currentUser.toString();
  // var name = currentUser!.displayName.toString();

  /// Function to get the currently logged in user
  void getCurrentUser() {
    var currentUser = _auth.currentUser;
    if (currentUser != null) {
      // User is signed in
      String cusername = currentUser.uid.toString();
    } else {
      // User is not signed in
    }
  }

  @override
  void initState() {
    getCurrentUser();

    super.initState();

    print("X-Code");
  }

  FirebaseAuth get newMethod => _auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          title: Text("Get Data"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                })
          ],
        ),
        body: Column(
          children: <Widget>[
            Text("Hello Empty Screens 4"),
            Text("Hello Empty Screens 4 {$firebaseUser![f001user]}"),
            Text("Hello Empty Screens 4 {$getCurrentUser()![f001user]}"),
            Text(_auth.currentUser!.uid.toString()),
            Text(_auth.currentUser!.email.toString()),
          ],
        ));
  }
}

// ignore: camel_case_types
// class Nameuser {
//   var firebaseUser = FirebaseAuth.instance.currentUser;
//   var nameusr = FirebaseAuth.instance.currentUser!.uid;
//   return nameusr;
// }
