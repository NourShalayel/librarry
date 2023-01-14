import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFireStorge {
  FirebaseFireStorge._();
  static FirebaseFireStorge firebaseFireStorge = FirebaseFireStorge._();
  FirebaseStorage storage = FirebaseStorage.instance;
  String? downloadUrl;

  Future<String?> UploadFile(image) async {
    if (image != null) {
      //Upload to Firebase
      print("*************************************");
      print(image.hashCode);
      var snapshot =
          await storage.ref().child(image.hashCode.toString()).putFile(File(image.path));
      downloadUrl = await snapshot.ref.getDownloadURL();
    } else {
      return 'No Image Path Received';
    }
  }
}
