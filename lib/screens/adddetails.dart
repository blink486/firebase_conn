import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/screens/getdocs.dart';
import 'package:firebase_conn/screens/searchsat.dart';
import 'package:flutter/material.dart';

import 'anothersearch.dart';

// import 'anothersearch.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  _AddDetailsState createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  TextEditingController postcode = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController business_name = new TextEditingController();
  TextEditingController business_desc = new TextEditingController();
  TextEditingController service_radius = new TextEditingController();
  TextEditingController searchstring = new TextEditingController();

  get firestore => null;

  get searchController => null;

  @override
  Widget build(BuildContext context) {
    // TextEditingController searchController2;
    var searchController2 = searchController;
    return
        // SingleChildScrollView(
        //   child:
        Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Add Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(hintText: "name"),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: surname,
                  decoration: InputDecoration(hintText: "surname"),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: postcode,
                  decoration: InputDecoration(hintText: "postcode"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(hintText: "email"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: business_name,
                  decoration: InputDecoration(hintText: "business name"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: business_desc,
                  decoration: InputDecoration(hintText: "business desc"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: service_radius,
                  decoration: InputDecoration(hintText: "service radius"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  controller: searchstring,
                  decoration: InputDecoration(hintText: "Search String"),
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
                  child: Text("Pass Search String"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () {
                    Map<String, dynamic> data = {
                      // "f01name": name.text,
                      // "f02surname": surname.text,
                      // "f03postcode": postcode.text,
                      // "f04business_name": business_name.text,
                      // "f05business_desc": business_desc.text,
                      // "f06service_radius": service_radius.text
                      "f01name": name.text,
                      "f02surname": surname.text,
                      "f03postcode": postcode.text,
                      "f04business_name": business_name.text,
                      "f05business_desc": business_desc.text,
                      "f06service_radius": service_radius.text,
                      "f07email": email.text
                    };
                    FirebaseFirestore.instance
                        .collection("new_biz_add")
                        .add(data);
                  },
                  child: Text("Submit2"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    DocumentSnapshot variable = await FirebaseFirestore.instance
                        .collection('newc')
                        .doc('7668IAEwXzIZ56arbn70')
                        .get();

                    print(variable['field1']);
                    print(variable['field2']);
                    print(variable['field3']);
                  },
                  child: Text("Get Data"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    var result = await FirebaseFirestore.instance
                        .collection('new_biz_add')
                        .where('f01name', isEqualTo: "Bill")
                        // .doc('7668IAEwXzIZ56arbn70')
                        .get();
                    result.docs.forEach((element) {
                      print(element.data()['f01name']);
                    });
                  },
                  child: Text("Get Bob Data"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    FirebaseFirestore.instance
                        .collection("new_biz_add")
                        .where("f01name", isEqualTo: "Bob")
                        .get()
                        .then((querySnapshot) {
                      querySnapshot.docs.forEach((result) {
                        // print(result.data());
                        print(result['f01name']);
                        print(result['f02surname']);
                        print(result['f03postcode']);
                        print(result['f04business_name']);
                        print(result['f05business_desc']);
                        print(result['f06service_radius']);
                        print(result['f07email']);
                        // print(result.data());
                      });
                    });
                  },
                  child: Text("Find named Norman Search Data"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GetData()));
                  },
                  child: Text("Get All Your Datas s"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyCustomForm()));
                  },
                  child: Text("Get All Your floating Search Butt on"),
                ),
                TextField(
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                      hintText: 'search Courses',
                      hintStyle: TextStyle(color: Colors.redAccent)),
                  controller: searchController2,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    var result = await FirebaseFirestore.instance
                        .collection('new_biz_add')
                        .where('f01name', isEqualTo: searchController2)
                        // .doc('7668IAEwXzIZ56arbn70')
                        .get();
                    result.docs.forEach((element) {
                      print(element.data()['f01name']);
                      // print(searchController2);
                    });
                  },
                  child: Text("Get Search Data"),
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.flight_land),
                      title: const Text("Trix's airplane"),
                      subtitle: const Text('The airplane is only in Act II.'),
                      // onTap: () => print("Hello"),
                      onTap: () async {
                        var result = await FirebaseFirestore.instance
                            .collection('new_biz_add')
                            .where('f01name', isEqualTo: searchController2)
                            // .doc('7668IAEwXzIZ56arbn70')
                            .get();
                        result.docs.forEach((element) {
                          print(element.data()['f01name']);
                          // print(searchController2);
                        });
                      },
                    ),
                    Center(
                      child: Text("Hello"),
                    )
                  ],
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
