import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../Services/FirebaseFireStoreHelper.dart';
import '../model/CategoryModel.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categories> CategoriesList = [];

  getCategoriesInList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFireStoreHelper.fireStoreHelper.getAllCategories();
    CategoriesList.clear();
    for (var i in snapshot.docs) {
      CategoriesList.add(Categories.fromJson(i.data()));
    }
    notifyListeners();
  }
}
