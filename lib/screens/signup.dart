import 'package:firebase_conn/screens/register_business.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'anothersearch.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  // get firestore => null;

  // get searchController => null;

  @override
  Widget build(BuildContext context) {
    // TextEditingController searchController2;
    return
        // SingleChildScrollView(
        //   child:
        Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(hintText: "email"),
                ),
                SizedBox(height: 10.09),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(hintText: "password"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red, // foreground
                  ),
                  onPressed: () async {
                    // Map<String, dynamic> data = {
                    //   "f01email": email.text,
                    //   "f02password": password.text
                    // };
                    // FirebaseFirestore.instance.collection("register").add(data);
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email.text, password: password.text);

                      if (newUser != null) {
                        print(newUser);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => AddBusDetails(
                                // searchstr: searchstring.text,
                                ),
                          ),
                        );
                        // Navigator.pushNamed(context, AddBusDetails); // NEED TO LEARN ABOUT NAMED ROUTES
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Create New Business User"),
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
