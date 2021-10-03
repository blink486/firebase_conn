import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/screens/searchsat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'anothersearch.dart';

class AddToFolio extends StatefulWidget {
  const AddToFolio({Key? key, required this.businessId}) : super(key: key);
  final String businessId;

  @override
  _AddToFolioState createState() => _AddToFolioState();
}

class _AddToFolioState extends State<AddToFolio> {
  TextEditingController projectName = new TextEditingController();
  TextEditingController projectDesc = new TextEditingController();
  TextEditingController projectPostcode = new TextEditingController();
  TextEditingController projectCompletionDate = new TextEditingController();
  TextEditingController projectLink = new TextEditingController();
  TextEditingController projectImages = new TextEditingController();
  TextEditingController searchstring = new TextEditingController();

  // final _auth = FirebaseAuth.instance;
  // FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final currUser = FirebaseAuth.instance.currentUser!.uid;
      if (currUser != null) {
        String msg = "Hello";
        print(" $msg   $currUser");
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  GetCurrentUser() async {
    try {
      final currUser = FirebaseAuth.instance.currentUser!.uid.toString();
      if (currUser != null) {
        String msg = "Hello";
        print(" $msg   $currUser");
        return currUser;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currUser2 = FirebaseAuth.instance.currentUser!.uid.toString();
    // TextEditingController searchController2;
    return
        // SingleChildScrollView(
        //   child:
        Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Add Project $currUser2"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: projectName,
                  decoration: InputDecoration(hintText: "name"),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: projectDesc,
                  decoration: InputDecoration(hintText: "projectDesc"),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: projectPostcode,
                  decoration: InputDecoration(hintText: "projectPostcode"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  // DEV NOTES : Add date picker see: https://stackoverflow.com/questions/54127847/flutter-how-to-display-datepicker-when-textformfield-is-clicked
                  // onTap: () {
                  //   FocusScope.of(context).requestFocus(new FocusNode());
                  // },
                  controller: projectCompletionDate,
                  decoration:
                      InputDecoration(hintText: "projectCompletionDate"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  // keyboardType: TextInputType.emailAddress,
                  // obscureText: true,
                  controller: projectLink,
                  decoration: InputDecoration(hintText: "projectLink"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: projectImages,
                  decoration: InputDecoration(
                      hintText: "USe Image Picker and Link to Images"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: searchstring,
                  decoration: InputDecoration(
                      hintText: "Search String",
                      fillColor: Colors.green,
                      filled: true),
                ),
                SizedBox(height: 10.0),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GetDataS(
                                  searchstr: searchstring.text,
                                )));
                  },
                  child: Text("Pass Search String Path-> Logged in BusUser"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () {
                    Map<String, dynamic> data = {
                      "f00user": currUser2,
                      "f01businessId": widget.businessId,
                      "f02projectName": projectName.text,
                      "f03projectDesc": projectDesc.text,
                      "f04projectPostcode": projectPostcode.text,
                      "f05projectCompletionDate": projectCompletionDate.text,
                      "f06projectLink": projectLink.text,
                      "f07projectImages": projectImages.text
                    };
                    // DEV NOTES! 28-09: ADD Check to see if user 'currUser2' already exists Else register
                    FirebaseFirestore.instance.collection("folio").add(data);
                    Navigator.pop(context);
                  },
                  child: Text("Submit Project"),
                ),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
