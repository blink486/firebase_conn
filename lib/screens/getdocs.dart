//   Script from:  Mins 7:35 @  https://www.youtube.com/watch?v=QshpV3gh708

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
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
        ));
  }
}
