import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Page2 extends StatefulWidget {
  String message;
  Page2({Key? key, required this.message}) : super(key: key);
  @override
  _Page2State createState() => _Page2State(message: message);
}

class _Page2State extends State<Page2> {
  String message;
  _Page2State({Key? key, required this.message}) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      child: Text(message),
    );
  }
}
