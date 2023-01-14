import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../Proivder/AuthorsProvider.dart';
import '../Proivder/CategoriesProvider.dart';
import '../Services/FirebaseFirestorge.dart';
import '../model/AuthorModel.dart';
import '../model/BooksModel.dart';
import '../model/CategoryModel.dart';
import '../services/FirebaseFireStoreHelper.dart';
import 'addCategoryScreen.dart';

class addBook extends StatefulWidget {
  const addBook({Key? key}) : super(key: key);

  @override
  State<addBook> createState() => _addBookState();
}

class _addBookState extends State<addBook> {
  TextEditingController book_name_controller = TextEditingController();
  TextEditingController num_page_controller = TextEditingController();
  TextEditingController pub_year_controller = TextEditingController();
  TextEditingController language_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  PickedFile imageFile = PickedFile("");
  final ImagePicker picker = ImagePicker();

  final scaffoldState = GlobalKey<ScaffoldState>();

  final cat = FirebaseFireStoreHelper.fireStoreHelper.getCategoriesInList();
  final auth = FirebaseFireStoreHelper.fireStoreHelper.getAuthorInList();

  List<Categories>? cat_items =
      FirebaseFireStoreHelper.fireStoreHelper.CategoryList;
  List<Authors>? auth_items =
      FirebaseFireStoreHelper.fireStoreHelper.AuthorList;

  String? selectedCat;
  String? selectedCat_id;

  String? selectedAuth;
  String? selectedAuth_id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthorsProvider>(context, listen: false).geAuthorsInList();
    Provider.of<CategoriesProvider>(context, listen: false)
        .getCategoriesInList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(Icons.arrow_back_ios_new),
        backgroundColor: Color(0xffea9ab5),
        title: Text("Add Book", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: imageFile != null
                      ? FileImage(File(imageFile.path))
                      : null,
                ),
                Positioned(
                    right: 20.0,
                    bottom: 20.0,
                    child: InkWell(
                      onTap: () {
                        scaffoldState.currentState
                            ?.showBottomSheet((context) => bottomSheet());
                      },
                      child: Icon(
                        Icons.camera,
                        color: Colors.teal,
                        size: 28.0,
                      ),
                    )),
              ]),
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
                            controller: book_name_controller,
                            decoration: InputDecoration(
                                hintText: "Book Name",
                                labelText: "Book Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: num_page_controller,
                            decoration: InputDecoration(
                                hintText: "pages number",
                                labelText: "pages number",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: pub_year_controller,
                            decoration: InputDecoration(
                                hintText: "publish year",
                                labelText: "publish year",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: language_controller,
                            decoration: InputDecoration(
                                hintText: "book language",
                                labelText: "book language",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: price_controller,
                            decoration: InputDecoration(
                                hintText: "book price",
                                labelText: "book price",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                        Consumer<CategoriesProvider>(
                          builder: (context, categoryprovider, _) =>
                              categoryprovider.CategoriesList.isEmpty
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          hint: Row(
                                            children: const [
                                              Icon(
                                                Icons.category,
                                                size: 16,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Select Category',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          items: cat_items
                                              ?.map(
                                                (item) =>
                                                    DropdownMenuItem<String>(
                                                  onTap: () {
                                                    selectedCat_id = item.id;
                                                    print(selectedCat_id);
                                                  },
                                                  value: item.name,
                                                  child: Text(
                                                    item.name.toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          value: selectedCat,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedCat = value as String;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.grey,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 50,
                                          buttonWidth: double.infinity,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            color: Colors.white,
                                          ),
                                          buttonElevation: 2,
                                          itemHeight: 40,
                                          itemPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: Colors.white,
                                          ),
                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                              const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(-20, 0),
                                        ),
                                      ),
                                    ),
                        ),
                        Consumer<AuthorsProvider>(
                          builder: (context, authorprovider, _) =>
                              authorprovider.AuthorsList.isEmpty
                                  ? Center(child: CircularProgressIndicator())
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          hint: Row(
                                            children: const [
                                              Icon(
                                                Icons.person,
                                                size: 16,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Select Author',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          items: auth_items
                                              ?.map((item) =>
                                                  DropdownMenuItem<String>(
                                                    onTap: () {
                                                      selectedAuth_id = item.id;
                                                      print(selectedAuth_id);
                                                    },
                                                    value: item.name,
                                                    child: Text(
                                                      item.name.toString(),
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ))
                                              .toList(),
                                          value: selectedAuth,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedAuth = value as String;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                          iconSize: 14,
                                          iconEnabledColor: Colors.grey,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 50,
                                          buttonWidth: double.infinity,
                                          buttonPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            color: Colors.white,
                                          ),
                                          buttonElevation: 2,
                                          itemHeight: 40,
                                          itemPadding: const EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          dropdownPadding: null,
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: Colors.white,
                                          ),
                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                              const Radius.circular(40),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          offset: const Offset(-20, 0),
                                        ),
                                      ),
                                    ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  FirebaseFireStorge.firebaseFireStorge
                                      .UploadFile(imageFile)
                                      .then((value) => FirebaseFireStoreHelper.fireStoreHelper.addBook(
                                      Books(
                                          name: book_name_controller.text,
                                          img: FirebaseFireStorge
                                              .firebaseFireStorge.downloadUrl,
                                          num_page: int.parse(
                                              num_page_controller.text),
                                          pub_year: int.parse(
                                              pub_year_controller.text),
                                          category_name: selectedCat,
                                          auth_name: selectedAuth,
                                          language: language_controller.text,
                                          price: double.parse(
                                              price_controller.text))))
                                      .then((value) => Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(builder: (context) => addCategory())));
                                },
                                child: Text("SAVE",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(17)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0xffea9ab5)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    )))),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choice course image",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  child: Row(
                    children: <Widget>[
                      Text("Camera"),
                      Icon(Icons.camera),
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Text("Gallary"),
                      Icon(Icons.image),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile!;
    });
  }
}
