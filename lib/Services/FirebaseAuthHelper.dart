
import 'package:firebase_auth/firebase_auth.dart';

import '../model/UsersModel.dart';
import 'FirebaseFireStoreHelper.dart';



class FirebaseAuthHelper {
  FirebaseAuthHelper._();
  static FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future register(Users users) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: users.email!, password: users.password!);
    String id = userCredential.user!.uid;

    FirebaseFireStoreHelper.fireStoreHelper.SaveUserData(users, id);
  }

  Future login(Users users) async {
    await auth.signInWithEmailAndPassword(
        email: users!.email!, password: users!.password!);

  }

  Future logout() async {
    await auth.signOut();
  }

  Future resetPassword(Users users) async {
    print(users.email);

    await auth.sendPasswordResetEmail(email: users.email!);
  }
}