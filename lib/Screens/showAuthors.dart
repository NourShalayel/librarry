import 'package:flutter/material.dart';
import 'package:librarry/Screens/addAuthorScreen.dart';
import 'package:provider/provider.dart';
import 'package:scaled_list/scaled_list.dart';

import '../Proivder/AuthorsProvider.dart';

class showAuthors extends StatefulWidget {
  const showAuthors({Key? key}) : super(key: key);

  @override
  State<showAuthors> createState() => _showAuthorsState();
}

class _showAuthorsState extends State<showAuthors> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthorsProvider>(context, listen: false).geAuthorsInList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AuthorsProvider>(
      builder: (context, authorprovider, _) => authorprovider
              .AuthorsList.isEmpty
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
                              "Our Authors",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            ScaledList(
                              itemCount: authorprovider.AuthorsList.length,
                              itemColor: (index) {
                                return kMixedColors[
                                    index % kMixedColors.length];
                              },
                              itemBuilder: (index, selectedIndex) {
                                final author =
                                    authorprovider.AuthorsList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                addAuthor()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 15),
                                      Text(
                                        author.name!,
                                        style: TextStyle(
                                            color: Colors.orange,
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
