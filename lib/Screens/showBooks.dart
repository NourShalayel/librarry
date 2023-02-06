import 'package:flutter/material.dart';
import 'package:librarry/Proivder/BooksProvider.dart';
import 'package:librarry/Screens/addAuthorScreen.dart';
import 'package:provider/provider.dart';
import 'package:scaled_list/scaled_list.dart';

import '../Proivder/AuthorsProvider.dart';

class showBooks extends StatefulWidget {
  const showBooks({Key? key, required this.catName}) : super(key: key);
  final String catName;

  @override
  State<showBooks> createState() => _showBooksState();
}

class _showBooksState extends State<showBooks> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BooksProvider>(context, listen: false).getBooksCatInList('${widget.catName}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: Text('${widget.catName}'),
        // ),

        body: Consumer<BooksProvider>(
      builder: (context, bookprovider, _) => bookprovider.BooksList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            Text(
                              "Our Books",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            ScaledList(
                              itemCount: bookprovider.BooksList.length,
                              itemColor: (index) {
                                return kMixedColors[
                                    index % kMixedColors.length];
                              },
                              itemBuilder: (index, selectedIndex) {
                                final book =
                                    bookprovider.BooksList[index];
                                return InkWell(
                                  onTap: () {
                                    print("*********************************************");
                                    print(bookprovider.BooksList.length);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => addAuthor()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 15),
                                      Text(
                                        book.name!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: selectedIndex == index
                                                ? 25
                                                : 20),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    ));
  }

  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];
}
