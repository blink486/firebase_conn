//   Script from:  Mins 7:35 @  https://www.youtube.com/watch?v=QshpV3gh708

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataS extends StatefulWidget {
  const GetDataS({Key? key, required this.searchstr}) : super(key: key);
  final String searchstr;

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetDataS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data"),
      ),
      body: Center(
        child: Text(widget.searchstr),
      ),
    );
  }
}
