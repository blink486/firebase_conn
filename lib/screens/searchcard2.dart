//Script from:  Mins 7:35 @  https://www.youtube.com/watch?v=QshpV3gh708
//Example of simple passing of data from one screen to another
//and also of passing from Text Input Controller in one Page to a Class and display in
//in another Page/screen.
//completed : 2021-09-04

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/screens/getdocs.dart';
import 'package:firebase_conn/screens/resultclass.dart';
import 'package:firebase_conn/screens/searchcard.dart';
import 'package:firebase_conn/screens/searchcard2.dart';
import 'package:flutter/material.dart';

class GetDataJobs extends StatefulWidget {
  const GetDataJobs({Key? key, required this.searchstrJb}) : super(key: key);
  final String searchstrJb;

  @override
  _GetDataJobstate createState() => _GetDataJobstate();
}

// class _GetDataJobstate extends State<GetDataJobs> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Get Data"),
//       ),
//       body: Center(
//         child: Text(widget.searchstrJb),
//       ),
//     );
//   }
// }

class _GetDataJobstate extends State<GetDataJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('new_biz_add')
            .where('f04business_name', isEqualTo: widget.searchstrJb)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            // return Text('No XXXX Value');
            return new CircularProgressIndicator();
          }
// 'return script below from bottom sections:
// https://stackoverflow.com/questions/67564852/flutter-firestore-i-have-a-streambuilder-that-returns-a-certain-field-from-al
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot course = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // GetDataX 11/09/2021
                            builder: (BuildContext context) => GetDataCard(
                                  searchstr:
                                      snapshot.data!.docs[index].reference.id,
                                  //TO DO: Add Snapshot Item doc id and pass to create Card in next screen
                                )));
                  },
                  child: ListTile(
                    title: Text(
                      "Co. Name : " + course['f04business_name'],
                    ),
                    subtitle:
                        Text("Service : " + course['f05business_desc'] + "  "),
                    trailing: Text("App_Path -> 3"),
                  ),
                );
              });
        },
      ),
    );
  }
}
