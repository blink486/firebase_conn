import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_conn/services/datacontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

// Use following Code set.
// https://stackoverflow.com/questions/67561697/cannot-get-documents-or-docs-with-cloud-firestore-2-1-0-flutter
class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late final QuerySnapshot snapshotData;
  late bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              // leading: CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     snapshotData.docs[index].data()['image']),
              // ),
              // title: Text(snapshotData.docs[index].data()!=null['name'], )
              title: Text(snapshotData.docs[index]['name']));
        },
      );
    }

    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.clear), onPressed: () {}),
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExecuted = true;
                      });
                    });
                  });
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'search Courses',
              hintStyle: TextStyle(color: Colors.white)),
          controller: searchController,
        ),
        backgroundColor: Colors.black,
      ),
      body: isExecuted
          ? searchedData()
          : Container(
              child: Center(
                child: Text(
                  'Search Any Courses',
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ),
    );
  }
}
