import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class alldata extends StatefulWidget {
  const alldata({Key? key}) : super(key: key);

  @override
  _alldataState createState() => _alldataState();
}

class _alldataState extends State<alldata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("all data"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('test').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('No Value');
          }
          // return ListView(
          //   children: snapshot.data!.docs.map((Document) async {
          //     return Text(document['field1']);
          //   }).toList(),
          //   // PAUSED 7:35: https://www.youtube.com/watch?v=QshpV3gh708
          // );

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data!.docs[index];
                return ListTile(title: Text(course['field1']));
              });
        },
      ),
    );
  }
}
