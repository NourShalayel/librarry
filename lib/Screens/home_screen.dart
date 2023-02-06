import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librarry/Proivder/BooksProvider.dart';
import 'package:librarry/Screens/addAuthorScreen.dart';
import 'package:librarry/Screens/addBookScreen.dart';
import 'package:librarry/Screens/showAuthors.dart';
import 'package:librarry/Screens/showCategories.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BooksProvider>(context, listen: false).getLastBooksInList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xff3f51b5),
        title: Text("Home", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 10,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 00.0),
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
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset('assets/images/book.png')),
              ),
            ),
            Divider(
              color: Color(0xffd3cfcf),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => addCategory()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.category,
                        color: Color(0xff3f51b5),
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
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => addAuthor()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_add,
                        color: Color(0xff3f51b5),
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
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => addBook()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: Color(0xff3f51b5),
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
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => showCategories()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.category_outlined,
                        color: Color(0xff3f51b5),
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
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => showAuthors()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Color(0xff3f51b5),
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => login()));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Color(0xff3f51b5),
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
      body: Consumer<BooksProvider>(
        builder: (context, bookprovider, _) => bookprovider.BooksList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(
                padding: EdgeInsets.only(left: 10, top: 20),
                children: [
                  Column(
                    children: [
                      Text(
                        "Last Books",
                        style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold , color: Colors.indigo),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25, bottom: 25),
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: bookprovider.BooksList.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(right: 20.0),
                                alignment: Alignment.center,
                                child: Stack(children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      image: DecorationImage(
                                          image: NetworkImage(bookprovider
                                              .BooksList[index].img!),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: MediaQuery.of(context).size.height /
                                        4.4,
                                    padding: EdgeInsets.all(10.0),
                                    // alignment: Alignment.bottomLeft,
                                    // child: Text(
                                    //   bookprovider.BooksList[index].name!,
                                    //   style: TextStyle(color: Colors.white),
                                    // )
                                  ),
                                  // Container(
                                  //     width:
                                  //     MediaQuery.of(context).size.width / 2,
                                  //     height: MediaQuery.of(context).size.height /
                                  //         4,
                                  //     padding: EdgeInsets.all(10.0),
                                  //     alignment: Alignment.bottomLeft,
                                  //     child: Text(
                                  //       bookprovider.BooksList[index].category_name!,
                                  //       style: TextStyle(color: Colors.grey),
                                  //     ))
                                ]),
                              );

                              //   Container(
                              //   margin: EdgeInsets.only(right: 19),
                              //   height: 210,
                              //   width: 153,
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       color: Colors.pink,
                              //       image: DecorationImage(
                              //         image:NetworkImage(bookprovider.BooksList[index].img!)
                              //       )
                              //   ),
                              // );
                            }),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
