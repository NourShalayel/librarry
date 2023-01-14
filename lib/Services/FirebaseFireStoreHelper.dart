import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/AuthorModel.dart';
import '../model/BooksModel.dart';
import '../model/CategoryModel.dart';
import '../model/UsersModel.dart';

class FirebaseFireStoreHelper {
  FirebaseFireStoreHelper._();

  static FirebaseFireStoreHelper fireStoreHelper = FirebaseFireStoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String userCollection = "Users";
  final String categoryCollection = "Categories";
  final String authorCollection = "authors";
  final String bookCollection = "Books";

  Future SaveUserData(Users users, String id) async {
    await firestore.collection(userCollection).doc(id).set({
      "id": id,
      "email": users.email,
      "name": users.name,
    });
  }

  Future addCategory(Categories category) async {
    DocumentReference docRef =
        await firestore.collection(categoryCollection).add(category.toJson());
    docRef.update({'id': docRef.id});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> allCategories =
        await firestore.collection(categoryCollection).get();
    return allCategories;
  }

  Future addAuthor(Authors author) async {
    DocumentReference docRef =
        await firestore.collection(authorCollection).add(author.toJson());
    docRef.update({'id': docRef.id});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllAuthors() async {
    QuerySnapshot<Map<String, dynamic>> allAuthors =
        await firestore.collection(authorCollection).get();
    return allAuthors;
  }

  List<Categories> CategoryList = [];

  getCategoriesInList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFireStoreHelper.fireStoreHelper.getAllCategories();
    CategoryList.clear();
    for (var i in snapshot.docs) {
      CategoryList.add(Categories.fromJson(i.data()));
    }
  }

  List<Authors> AuthorList = [];

  getAuthorInList() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFireStoreHelper.fireStoreHelper.getAllAuthors();
    AuthorList.clear();
    for (var i in snapshot.docs) {
      AuthorList.add(Authors.fromJson(i.data()));
    }
  }


  Future addBook(Books book) async {
    DocumentReference docRef =
    await firestore.collection(authorCollection).add(book.toJson());
    docRef.update({'id': docRef.id});
  }
}
