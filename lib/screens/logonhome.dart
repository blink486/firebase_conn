//   Script from:  Mins 7:35 @  https://www.youtube.com/watch?v=QshpV3gh708

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'folio.dart';

class UserBusinessHome extends StatefulWidget {
  final String searchstr;
  const UserBusinessHome({Key? key, required this.searchstr}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<UserBusinessHome> {
  // FirebaseFirestore db = FirebaseFirestore.instance
  //     .collection('register')
  //     .doc() as FirebaseFirestore;
  int currentIndex = 0;
  final screens = [
    MyApp(),
  ];

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('register');

  // Future getDoc(objval) async {
  //   String objrt = objval;

  //   FutureBuilder<DocumentSnapshot>(
  //       future: FirebaseFirestore.instance
  //           .collection('register')
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
  //           .collection('register')
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
  //       .collection('register')
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
        title: Text("Get Data" /*+ widget.searchstr*/),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // GetDataX 11/09/2021
                        builder: (BuildContext context) => MyApp(

                            //TO DO: Add Snapshot Item doc id and pass to create Card in next screen
                            )));
              },
              child: Text(
                "HOME",
                style: TextStyle(color: Colors.amber),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
                      .collection('register')
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
                    .collection('register')
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
                        .collection('register')
                        .doc(widget.searchstr)
                        .get(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                        .collection('register')
                        .doc(widget.searchstr)
                        .get(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                        .collection('register')
                        .doc(widget.searchstr)
                        .get(),
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
              //     .collection('register')
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
                        .collection('register')
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
                        builder: (BuildContext context) => AddToFolio(
                            // businessId: result.data()!['f04business_name']),
                            businessId: widget.searchstr),
                      ),
                    );
                  },
                  child: Text("Add New Project to folio "),
                ),
              ),
              Container(
                height: 50,
                width: 200,
                child: Center(
                    child: Text(
                  "Dev Notes: Add List OR Grid View of Projects / Samples ",
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                )),
              ),
              // Container(
              //   child:
              Row(children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 500,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('folio')
                          .where('f01businessId', isEqualTo: widget.searchstr)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          // return Text('No XXXX Value');
                          print("curr uaer = No Projects Listed");
                          return new CircularProgressIndicator();
                        }
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot projList =
                                  snapshot.data!.docs[index];
                              return ListTile(
                                tileColor: Colors.amber,
                                leading: SizedBox(
                                  height: 10,
                                  width: 20,
                                  child: Icon(
                                    Icons.safety_divider,
                                    size: 50,
                                  ),
                                ),
                                title: Text(
                                  "Project : " + projList['f02projectName'],
                                ),
                                subtitle: Text("Service : " +
                                    projList['f03projectDesc'] +
                                    "  "),
                                horizontalTitleGap: 48,
                              );
                            });
                      },
                    ),
                  ),
                ),
              ]),

              FloatingActionButton(
                child: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  print("hello floating action");
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_task_rounded),
              label: 'search',
              backgroundColor: Colors.cyan),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.lightBlue,
          ),
        ],
        // type: BottomNavigationBarType.shifting,
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.grey,
        // iconSize: 40,
        // onTap: _onItemTap,
        // elevation: 5
      ),
    );
  }
}
