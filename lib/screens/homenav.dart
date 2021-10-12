import 'package:firebase_conn/screens/signup.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Hellos"),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LogIn()));
              },
              child: Text(
                " < LOGIN >",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            Text("Hellos"),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()));
              },
              child: Text(
                " < REGISTER >",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
