import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'logonhome.dart';
import 'logonscreenresult.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String user = "loggedi";
  final currUser2 = FirebaseAuth.instance.currentUser!.uid.toString();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // DEVNOTES: CHECK https://firebase.flutter.dev/docs/firestore/usage/
      stream: FirebaseFirestore.instance.collection('register').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: const Text('NO DATA STREAM Loading events...'));
        }
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot businessDoc = snapshot.data!.docs[index];
            // Dev Notes Return CARD and Apply ONclic to Relevant Business Type OR Search
            // return Container(
            //   padding: EdgeInsets.all(12),
            //   color: Colors.greenAccent,
            //   child: Text(
            //     businessDoc['f05business_desc'],
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 22,
            //         backgroundColor: Colors.blue),
            //   ),
            // );

            return Card(
              elevation: 4.0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        businessDoc['f04business_name'],
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                        businessDoc['f05business_desc'],
                        style: TextStyle(fontSize: 8),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                // GetDataX 11/09/2021
                                builder: (BuildContext context) =>
                                    UserBusinessHome(
                                      searchstr: snapshot
                                          .data!.docs[index].reference.id,
                                      //TO DO: Add Snapshot Item doc id and pass to create Card in next screen
                                    )));
                      },
                      trailing: Icon(Icons.favorite_outline),
                    ),
                    Container(
                      height: 20.0,
                      child: Ink.image(
                        image: NetworkImage(
                            "https://www.organic-center.org/sites/default/files/favicon-01-1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.centerLeft,
                      child:
                          Text("UserID: " + businessDoc['f00user'].toString()),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "UserID2: " + snapshot.data!.docs[index].reference.id,
                      ),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          child: const Text(
                            'CONTACT AGENT',
                            style: TextStyle(fontSize: 10),
                          ),
                          onPressed: () {/* ... */},
                        ),
                        TextButton(
                          child: const Text(
                            'LEARN MORE',
                            style: TextStyle(fontSize: 10),
                          ),
                          onPressed: () {/* ... */},
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
// ORIGINAL USING  Widget ListView.builder Rather Than Card
        // return ListView.builder(
        //     itemCount: snapshot.data!.docs.length,
        //     itemBuilder: (context, index) {
        //       DocumentSnapshot businessDoc = snapshot.data!.docs[index];
        //       return ListTile(
        //         title: Text(
        //           businessDoc['f04business_name'],
        //         ),
        //         subtitle: Text(businessDoc['f05business_desc']),
        //       );
        //     });
      },
    );
  }
}

// ORIGINAL SIMPLE Widget
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome Screen'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20.0),
//         child: Center(
//           child: Text('Hello'),
//         ),
//       ),
//     );
//   }
// }
