import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:librarry/Proivder/BooksProvider.dart';
import 'package:librarry/check_login.dart';
import 'package:provider/provider.dart';

import 'Proivder/AuthorsProvider.dart';
import 'Proivder/CategoriesProvider.dart';
import 'firebase_options.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<CategoriesProvider>(create: (context) {
            return CategoriesProvider();
          }),
          ChangeNotifierProvider<AuthorsProvider>(create: (context) {
            return AuthorsProvider();
          }),
          ChangeNotifierProvider<BooksProvider>(create: (context) {
            return BooksProvider();
          }),
        ],
        child: MaterialApp(
          home: MyApp(),
        )),
  );}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error 404"),
              ),
            );
          } else if (snapshot.connectionState != ConnectionState.done) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  color: Colors.green,
                  strokeWidth: 7,
                ),
              ),
            );

          } else {
            return check_login();
          }
        });
  }
}
