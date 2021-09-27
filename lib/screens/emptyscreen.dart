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
        body: Container(
          child: Text("Hello Empty Screen"),
        ));
  }
}
