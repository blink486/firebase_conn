//   Script from:  Mins 7:35 @  https://www.youtube.com/watch?v=QshpV3gh708

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/alldata.dart';
import 'package:flutter/material.dart';

class GetDataCard extends StatefulWidget {
  final String searchstr;
  const GetDataCard({Key? key, required this.searchstr}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetDataCard> {
  // FirebaseFirestore db = FirebaseFirestore.instance
  //     .collection('new_biz_add')
  //     .doc() as FirebaseFirestore;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('new_biz_add');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef
        .where('f01name', isEqualTo: widget.searchstr)
        .get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);

    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('new_biz_add')
        .doc(widget.searchstr)
        .get();
    String lname = variable.get("f01name");

    print(variable);
    print(lname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("Get Data"),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc3MzQ3NjA5N15BMl5BanBnXkFtZTcwMzY5OTY3Nw@@._V1_SX1777_CR0,0,1777,999_AL_.jpg")),
            Container(
              height: 100,
              width: 300,
              color: Colors.amber,
              // snapshot.data.documents.map((DocumentSnapshot document){
              //   return new Text(document['data']);)

              child: Text("nme"),
            ),
            Container(
              height: 100,
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('new_biz_add')
                    .doc(widget.searchstr)
                    .get(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Center(
                      child: Text(snapshot.hasError.toString()),
                    );
                  return snapshot.hasData
                      ? Text(
                          "${snapshot.data!['f01name']}",
                          style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      : Container();
                },
              ),
            ),
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('new_biz_add')
                  .doc(widget.searchstr)
                  .get(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text(snapshot.hasError.toString()),
                  );
                return snapshot.hasData
                    ? Text(
                        "${snapshot.data!['f04business_name']}",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    : Container();
              },
            ),
            Container(
              height: 100,
              width: 300,
              color: Colors.green,
              // snapshot.data.documents.map((DocumentSnapshot document){
              //   return new Text(document['data']);)
              child: Text(widget.searchstr),
            ),
          ],
        ),

        // // child: Text(widget.searchstr),
        // DocumentSnapshot variable = await FirebaseFirestore.instance
        //     .collection('new_biz_add')
        //     .doc(widget.searchstr)
        //     .get();

        // print('Doc Id is: ' + variable.id);
        // print(variable['f07email']);

        // // print(variable['field3']);
      ),
    );
  }
}
