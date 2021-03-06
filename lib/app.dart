import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    print(kIsWeb);
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong!");
          return Result();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          GoogleAuthProvider googleProvider = GoogleAuthProvider();
          googleProvider
              .addScope('https://www.googleapis.com/auth/contacts.readonly');
          googleProvider
              .setCustomParameters({'login_hint': 'user@example.com'});
          Future<UserCredential> signInWithGoogle() async {
            GoogleAuthProvider googleProvider = GoogleAuthProvider();

            googleProvider
                .addScope('https://www.googleapis.com/auth/contacts.readonly');
            googleProvider
                .setCustomParameters({'login_hint': 'user@example.com'});
            return await FirebaseAuth.instance.signInWithPopup(googleProvider);
          }

          print(signInWithGoogle());
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
        title: "Nguyen Chi Vy",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Shopping"),
          ),
          body: Center(
            child: Text("Books"),
          ),
        ));
  }
}

class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hello");
    return MaterialApp(
        title: "Nguyen Chi Vy",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Shopping"),
          ),
          body: Center(
            child: Text("Loading"),
          ),
        ));
  }
}
