import 'package:firebase_conn/screens/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Page1 extends StatefulWidget {
//   @override
//   _Page1State createState() => _Page1State();
// }

// class _Page1State extends State<Page1> {
//   final _chatController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(bottomNavigationBar: _getFooter(), body: Container());
//   }

//   Widget _getFooter() {
//     return Container(
//         child: Row(children: <Widget>[
//       Container(
//         child: TextFormField(
//           controller: _chatController,
//         ),
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Page2(message: _chatController.text),
//             ),
//           );
//         },
//         child: Text("Send Message"),
//       )
//     ]));
//   }
// }
