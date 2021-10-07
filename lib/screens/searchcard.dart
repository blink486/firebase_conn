//   Script from:  Mins 7:35 @  https://www.youtube.com/watch?v=QshpV3gh708

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/screens/searchcard2.dart';
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

  // Future getDoc(objval) async {
  //   String objrt = objval;

  //   FutureBuilder<DocumentSnapshot>(
  //       future: FirebaseFirestore.instance
  //           .collection('new_biz_add')
  //           .doc(widget.searchstr)
  //           .get(),
  //       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //         if (snapshot.hasError)
  //           return Center(
  //             child: Text(snapshot.hasError.toString()),
  //           );
  //         return snapshot.hasData
  //             ? Text("${snapshot.data![objrt]}")
  //             : Text("EMpty da");
  //       });
  // }

  // Future<String> getDoc(objval) async {
  //   String objrt = objval;

  //   FutureBuilder<DocumentSnapshot>(
  //       future: FirebaseFirestore.instance
  //           .collection('new_biz_add')
  //           .doc(widget.searchstr)
  //           .get(),
  //       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //         if (snapshot.hasError)
  //           return Center(
  //             child: Text(snapshot.hasError.toString()),
  //           );
  //         return snapshot.hasData
  //             ? Text("${snapshot.data![objrt]}")
  //             : Text("EMpty da");
  //       });

  //   return "Hello";
  // }

  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRef
  //       .where('f01name', isEqualTo: widget.searchstr)
  //       .get();

  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  //   print(allData);

  //   DocumentSnapshot variable = await FirebaseFirestore.instance
  //       .collection('new_biz_add')
  //       .doc(widget.searchstr)
  //       .get();
  //   String lname = variable.get("f01name");

  //   print(variable);
  //   print(lname);
  //   // return lname;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Get Data" + widget.searchstr),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.pink,
              foregroundColor: Colors.pink,
              backgroundImage: NetworkImage(
                  // "https://images-na.ssl-images-amazon.com/images/M/MV5BMTc3MzQ3NjA5N15BMl5BanBnXkFtZTcwMzY5OTY3Nw@@._V1_SX1777_CR0,0,1777,999_AL_.jpg"),

                  "https://www.organic-center.org/sites/default/files/favicon-01-1.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              height: 61,
              width: 300,
              color: Colors.teal,
              // snapshot.data.documents.map((DocumentSnapshot document){
              //   return new Text(document['data']);)

              child: Text(
                "Company Details:",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Container(
              height: 40,
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
                          "Name: ${snapshot.data!['f04business_name']}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
                        "${snapshot.data!['f05business_desc']}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    : Container();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(children: <Widget>[
                Icon(
                  Icons.person,
                  size: 20,
                  color: Colors.white,
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
                            " : ${snapshot.data!['f01name']} ${snapshot.data!['f02surname']}",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : Container();
                  },
                )
              ]),
            ),
            Container(
              child: Row(children: <Widget>[
                Icon(
                  Icons.phone,
                  size: 20,
                  color: Colors.white,
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
                            " : ${snapshot.data!['f06service_radius']}",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : Container();
                  },
                )
              ]),
            ),
            Container(
              child: Row(children: <Widget>[
                Icon(
                  Icons.email_outlined,
                  size: 20,
                  color: Colors.white,
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
                            " : ${snapshot.data!['f07email']}",
                            style: TextStyle(
                                color: Colors.amberAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        : Container();
                  },
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 300,
              color: Colors.teal,
              child: Text(
                "Document Id :" + widget.searchstr,
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 40,
              width: 300,
              color: Colors.teal,
              child: Text("getDoc('f04business_name').toString()"),
              // child: Text(getData().toString()),

              // child: Text(getDoc(widget.searchstr).toString()),
              // child: Text(getDoc.toString()),
              // "${snapshot.data!['f04business_name']}",
              // style: TextStyle(
              //     color: Colors.amberAccent,
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold),
            ),
            Container(
              height: 20,
              width: 300,
              color: Colors.teal,
              child: Text(
                "Document Id :" + widget.searchstr,
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // TextButton(
            //   style: TextButton.styleFrom(
            //     primary: Colors.red, // foreground
            //   ),
            //   onPressed: () async {
            // DocumentSnapshot variable = await FirebaseFirestore.instance
            //     .collection('new_biz_add')
            //     .doc('7668IAEwXzIZ56arbn70')
            //     .get();
            // print(variable.data());
            // FirebaseFirestore.instance
            //     .collection("users")
            //     .where('f04business_name', isEqualTo: widget.searchstr)
            //     .get();
            //   .then((value) {
            // value.docs.forEach((result) {
            //   print(result.data()["somthins"]);

            //     // });
            //   });
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (BuildContext context) =>
            //               GetDataJobs(searchstrJb: result.data())));
            // },
            // child: Text("Add Your Data Path ->4"),

            // ),

            Container(
              height: 40,
              width: 300,
              color: Colors.white,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red, // foreground
                ),
                onPressed: () async {
                  var result = await FirebaseFirestore.instance
                      .collection('new_biz_add')
                      // .where('f01name', isEqualTo: widget.searchstr)
                      .doc(widget.searchstr)
                      .get();
                  // result.docs.forEach((element) {
                  //   print(element.data()['f01name']);
                  //   // print(searchController2);
                  // });
                  print(widget.searchstr);
                  print(result.data()!['f01name']);
                  print(result.data()!['f04business_name']);
                  print(result.data()!['f03postcode']);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => GetDataJobs(
                              searchstrJb:
                                  result.data()!['f04business_name'])));
                },
                child: Text("View Jobs by this Business ->5 "),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
