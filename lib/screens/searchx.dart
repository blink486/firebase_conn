import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/services/datacontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchx extends StatefulWidget {
  const Searchx({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

// Use following Code set.
// https://stackoverflow.com/questions/67561697/cannot-get-documents-or-docs-with-cloud-firestore-2-1-0-flutter
class _SearchState extends State<Searchx> {
  final TextEditingController searchController = TextEditingController();
  late final QuerySnapshot snapshotData;
  late bool isExecuted = false;
  // @override
  // Widget build(BuildContext context) {
  //   Widget searchedData() {
  //     return ListView.builder(
  //       itemCount: snapshotData.docs.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return ListTile(
  //             // leading: CircleAvatar(
  //             //   backgroundImage: NetworkImage(
  //             //     snapshotData.docs[index].data()['image']),
  //             // ),
  //             // title: Text(snapshotData.docs[index].data()!=null['name'], )
  //             title: Text(snapshotData.docs[index]['name']));
  //       },
  //     );
  //   }

  @override
  Widget build(BuildContext context) {
    Widget searchedDatax() {
      return Scaffold(
        appBar: AppBar(
          title: Text("Get Data"),
        ),
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('new_biz_add').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text('No Value');
            }
// 'return script below from bottom sections:
// https://stackoverflow.com/questions/67564852/flutter-firestore-i-have-a-streambuilder-that-returns-a-certain-field-from-al
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot course = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(
                      course['f04business_name'],
                    ),
                    subtitle: Text(course['f05business_desc']),
                  );
                });
          },
        ),
      );
    }
  }
}
