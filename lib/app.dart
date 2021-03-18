import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong!");
          return Result();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          print("My app");
          return Result();
        }
        print("Loading");
        return Result();
      },
    );
  }
}

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hello");
    return MaterialApp(
        title: "Hello World",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Book Shop"),
          ),
          body: Center(
            child: Text("List Book"),
          ),
        ));
  }
}

class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hello");
    return MaterialApp(
        title: "Hello world",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Book Shop"),
          ),
          body: Center(
            child: Text("Loading"),
          ),
        ));
  }
}
