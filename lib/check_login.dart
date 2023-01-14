
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:librarry/Screens/home.dart';
import 'package:librarry/Screens/login.dart';


class check_login extends StatelessWidget {
  const check_login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
          if(snapshot.hasData){
            return home();
          }else{
            return login();
          }
        });
  }
  }

