import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librarry/Screens/addAuthorScreen.dart';
import 'package:librarry/Screens/addBookScreen.dart';
import 'package:librarry/Screens/showAuthors.dart';
import 'package:librarry/Screens/showCategories.dart';

import '../Services/FirebaseAuthHelper.dart';
import 'addCategoryScreen.dart';
import 'login.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffea9ab5),
        title: Text("Home", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 10,
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/personal.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Rachelle D.Michael',
                    )),
              ),
            ),

            Divider(
              color: Color(0xffd3cfcf),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => addCategory()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.category,
                        color: Color(0xffea9ab5),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Add Category",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xffd3cfcf),
            ),


            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => addAuthor()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_add,
                        color: Color(0xffea9ab5),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Add Author",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xffd3cfcf),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => addBook()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: Color(0xffea9ab5),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Add Book",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xffd3cfcf),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => showCategories()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.category_outlined,
                        color: Color(0xffea9ab5),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Show Categories",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xffd3cfcf),
            ),

            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => showAuthors()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xffea9ab5),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Show Authors",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xffd3cfcf),
            ),


            InkWell(
              onTap: () async {
                FirebaseAuthHelper.firebaseAuthHelper.logout();
                if (await FirebaseAuth.instance.currentUser != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => login()));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color(0xffea9ab5),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Log out",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xffd3cfcf),
            ),

          ],
        ),
      ),

    );
  }
}
