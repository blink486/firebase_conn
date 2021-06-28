// Program based on following :
// Store:  https://www.youtube.com/watch?v=5u3p1NDjw60
// get https://www.youtube.com/watch?v=QshpV3gh708

import 'package:firebase_conn/alldata.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController sampledata1 = new TextEditingController();

  TextEditingController sampledata2 = new TextEditingController();
// void getMessages() {
//   final  messages = await
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: sampledata1,
                decoration: InputDecoration(hintText: "sample Data 1"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: sampledata2,
                decoration: InputDecoration(hintText: "Sample Data 22"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red, // foreground
                ),
                onPressed: () {
                  Map<String, dynamic> data = {
                    "field1": sampledata1.text,
                    "field2": sampledata2.text
                  };
                  FirebaseFirestore.instance.collection("test").add(data);
                },
                child: Text("Submit"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red, // foreground
                ),
                onPressed: () async {
                  DocumentSnapshot variable = await FirebaseFirestore.instance
                      .collection('test')
                      .doc('BsZe6YmjYjsWTbCLtgP8')
                      .get();
                  print(variable['field1']);
                  print(variable['field2']);
                },
                child: Text("Get Data"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red, // foreground
                ),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => alldata()));
                },
                child: Text("Get All Data"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
