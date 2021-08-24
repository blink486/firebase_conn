import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../alldata.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  TextEditingController postcode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Details"),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(hintText: "name"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: surname,
                decoration: InputDecoration(hintText: "surname"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: postcode,
                decoration: InputDecoration(hintText: "postcode"),
              ),
              SizedBox(height: 10.09),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red, // foreground
                ),
                onPressed: () {
                  Map<String, dynamic> data = {
                    "field1": name.text,
                    "field2": surname.text,
                    "field3": postcode.text
                  };
                  FirebaseFirestore.instance.collection("newc").add(data);
                },
                child: Text("Submit"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red, // foreground
                ),
                onPressed: () async {
                  DocumentSnapshot variable = await FirebaseFirestore.instance
                      .collection('newc')
                      .doc('BsZe6YmjYjsWTbCLtgP8')
                      .get();
                  print(variable['field1']);
                  print(variable['field2']);
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
    );
  }
}
