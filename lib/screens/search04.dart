import 'package:flutter/material.dart';
import 'dart:async';

class Terminal {
  final String id;
  final String source;
  final int newstories;

  Terminal({
    required this.id,
    required this.source,
    required this.newstories,
  });
}

class UserInput extends StatefulWidget {
  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  late String idInput;
  late String sourceInput;
  late int newstoriesInput;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'ID',
              ),
              onChanged: (val) {
                // (val) is looking at the value in the textbox.
                idInput = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Source',
              ),
              onChanged: (val) {
                sourceInput = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'New Stories',
              ),
              onChanged: (val) {
                newstoriesInput = int.parse(val);
              },
            ),
            TextButton(
              child: Text('submit'),
              onPressed: () {
                events.add(Terminal(
                    id: idInput,
                    source: sourceInput,
                    newstories: newstoriesInput));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyTerminal extends StatefulWidget {
  @override
  _MyTerminalState createState() => _MyTerminalState();
}

StreamController<Terminal> events = StreamController<Terminal>();

class _MyTerminalState extends State<MyTerminal> {
  List<Terminal> terminalNodes = [];

  @override
  initState() async {
    events.stream.listen((data) {
      terminalNodes.add(data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: terminalNodes.map((node) {
            return Card(
                child: Row(children: <Widget>[
              Container(
                  child: Text(node.id, style: TextStyle(color: Colors.green))),
              Column(children: <Widget>[
                Text(node.source),
                Text(node.newstories.toString())
              ])
            ]));
          }).toList(),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: MyTerminal()),
            Expanded(flex: 1, child: UserInput()),
          ],
        ),
      ),
    );
  }
}
