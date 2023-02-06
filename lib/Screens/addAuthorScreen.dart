import 'dart:io';

import 'package:flutter/material.dart';
import 'package:librarry/Screens/showAuthors.dart';

import '../Services/FirebaseFireStoreHelper.dart';
import '../model/AuthorModel.dart';

class addAuthor extends StatefulWidget {
  const addAuthor({Key? key}) : super(key: key);

  @override
  State<addAuthor> createState() => _addAuthorState();
}

class _addAuthorState extends State<addAuthor> {
  TextEditingController author_name_controller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: Icon(Icons.arrow_back_ios_new),
        backgroundColor: Color(0xff3f51b5),
        title: Text("Add Author", style: TextStyle(color: Colors.white)),
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
                          child: TextFormField(
                            validator: (inputValue) {
                              if (inputValue != null) {
                                if (inputValue.isEmpty) {
                                  return "please enter name";
                                } else if (inputValue.length < 3) {
                                  return "name is too short!";
                                }
                              }
                            },
                            controller: author_name_controller,
                            decoration: InputDecoration(
                                hintText: "Author Name",
                                labelText: "Author Name",
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
                                  if (formkey.currentState!.validate()) {
                                    FirebaseFireStoreHelper.fireStoreHelper
                                        .addAuthor(Authors(
                                        name: author_name_controller.text))
                                        .then((value) => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                        builder: (context) =>
                                            showAuthors())));
                                  }

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
