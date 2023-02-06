import 'package:flutter/material.dart';
import 'package:librarry/Screens/addCategoryScreen.dart';
import 'package:librarry/Screens/showBooks.dart';

import 'package:provider/provider.dart';
import 'package:scaled_list/scaled_list.dart';

import '../Proivder/CategoriesProvider.dart';

class showCategories extends StatefulWidget {
  const showCategories({Key? key}) : super(key: key);

  @override
  State<showCategories> createState() => _showCategoriesState();
}

class _showCategoriesState extends State<showCategories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)
        .getCategoriesInList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CategoriesProvider>(
      builder: (context, categoryproivder, _) => categoryproivder
              .CategoriesList.isEmpty
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
                              "our Categories",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            ScaledList(
                              itemCount: categoryproivder.CategoriesList.length,
                              itemColor: (index) {
                                return kMixedColors[
                                    index % kMixedColors.length];
                              },
                              itemBuilder: (index, selectedIndex) {
                                final category =
                                    categoryproivder.CategoriesList[index];
                                return InkWell(
                                  onTap: () {

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                showBooks(catName : category.name!)));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 15),
                                      Text(
                                        category.name!,
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
