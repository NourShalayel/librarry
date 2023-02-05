import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librarry/Screens/addAuthorScreen.dart';
import 'package:librarry/Screens/addBookScreen.dart';
import 'package:librarry/Screens/addCategoryScreen.dart';
import 'package:librarry/Screens/showAuthors.dart';
import 'package:librarry/Screens/showCategories.dart';

import '../Services/FirebaseAuthHelper.dart';
import 'login.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox.expand(
          child : ElevatedButton(
              onPressed: () async {
                FirebaseAuthHelper.firebaseAuthHelper.logout();
                if (await FirebaseAuth.instance.currentUser != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => login()));
                }
              },
              child:
              Text("log out",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold )),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(25)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff3f51b5)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )))
            // style: ElevatedButton.styleFrom(side: BorderRadius.circular(50.0),backgroundColor: Colors.pinkAccent , ),
          ),

        ),
            SizedBox.expand(
             child :ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => addCategory()));
                },
                child: Text("Add category",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(25)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3f51b5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )))
              // style: ElevatedButton.styleFrom(side: BorderRadius.circular(50.0),backgroundColor: Colors.pinkAccent , ),
            )
            ),
            SizedBox.expand(
              child :ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => showCategories()));
                },
                child: Text("show categories",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(25)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3f51b5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )))
              // style: ElevatedButton.styleFrom(side: BorderRadius.circular(50.0),backgroundColor: Colors.pinkAccent , ),
            )
    ),
            SizedBox.expand(
              child :ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => addAuthor()));
                },
                child: Text("Add author",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(25)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3f51b5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )))
              // style: ElevatedButton.styleFrom(side: BorderRadius.circular(50.0),backgroundColor: Colors.pinkAccent , ),
            )
            ),
            SizedBox.expand(
              child :ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => showAuthors()));
                },
                child: Text("show authors",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(25)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3f51b5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )))
              // style: ElevatedButton.styleFrom(side: BorderRadius.circular(50.0),backgroundColor: Colors.pinkAccent , ),
            )
            ),
            SizedBox.expand(
             child :ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>addBook()));
                },
                child: Text("add book",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(25)),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff3f51b5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )))
              // style: ElevatedButton.styleFrom(side: BorderRadius.circular(50.0),backgroundColor: Colors.pinkAccent , ),
            )
            ),

          ],
        ),
      ),
    );
  }
}
