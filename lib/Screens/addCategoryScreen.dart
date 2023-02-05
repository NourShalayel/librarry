import 'dart:io';


import 'package:flutter/material.dart';
import 'package:librarry/Screens/showCategories.dart';

import '../Services/FirebaseFireStoreHelper.dart';
import '../model/CategoryModel.dart';


class addCategory extends StatefulWidget {
  const addCategory({Key? key}) : super(key: key);

  @override
  State<addCategory> createState() => _addCategoryState();
}

class _addCategoryState extends State<addCategory> {
  TextEditingController categoty_name_controller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: Icon(Icons.arrow_back_ios_new),
        backgroundColor: Color(0xff3f51b5),
        title: Text("Add Category", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: categoty_name_controller,
                            decoration: InputDecoration(
                                hintText: "Category Name",
                                labelText: "Category Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {

                                  FirebaseFireStoreHelper
                                      .fireStoreHelper.addCategory(
                                      Categories(
                                          name: categoty_name_controller.text)
                                  ).then((value) =>
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>showCategories())));

                                },
                                child: Text("SAVE",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                style: ButtonStyle(
                                    padding:
                                    MaterialStateProperty.all<EdgeInsets>(
                                        EdgeInsets.all(17)),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff3f51b5)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50.0),
                                        )))),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }

}