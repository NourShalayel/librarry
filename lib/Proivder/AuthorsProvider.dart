import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../Services/FirebaseFireStoreHelper.dart';
import '../model/AuthorModel.dart';

class AuthorsProvider extends ChangeNotifier {
  List<Authors> AuthorsList = [];

  geAuthorsInList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFireStoreHelper.fireStoreHelper.getAllAuthors();
    AuthorsList.clear();
    for (var i in snapshot.docs) {
      AuthorsList.add(Authors.fromJson(i.data()));
    }
    notifyListeners();
  }
}
