import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:librarry/model/BooksModel.dart';

import '../Services/FirebaseFireStoreHelper.dart';

class BooksProvider extends ChangeNotifier {
  List<Books> BooksList = [];

  getBooksCatInList(String catName) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFireStoreHelper.fireStoreHelper.getAllBooks();
    BooksList.clear();
    for (var i in snapshot.docs) {
      if(i.data().containsValue(catName)){
        BooksList.add(Books.fromJson(i.data()));
      }
    }
    notifyListeners();
  }

  getBooksAuthInList(String authName) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFireStoreHelper.fireStoreHelper.getAllBooks();
    BooksList.clear();
    for (var i in snapshot.docs) {
      if(i.data().containsValue(authName)){
        BooksList.add(Books.fromJson(i.data()));
      }
    }
    notifyListeners();
  }

  getLastBooksInList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFireStoreHelper.fireStoreHelper.getLastBooks();
    BooksList.clear();
    for (var i in snapshot.docs) {
        BooksList.add(Books.fromJson(i.data()));
    }
    notifyListeners();
  }

}
