import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:librarry/Screens/forgot_password.dart';
import 'package:librarry/Screens/home.dart';
import 'package:librarry/Screens/register.dart';

import '../Services/FirebaseAuthHelper.dart';
import '../model/UsersModel.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [Icon(Icons.exit_to_app), Text("LOG IN")],
            ),
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
                                return "please enter email";
                              } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(EmailController.value.text)) {
                                return "you must enter email";
                              }
                            }
                          },
                          controller: EmailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              hintText: "Email Address",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(50.0))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (inputValue) {
                            if (inputValue != null) {
                              if (inputValue.isEmpty) {
                                return "please enter password";
                              } else if (inputValue.length < 8) {
                                return "password must be more than 8";
                              }
                            }
                          },
                          controller: PasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "password",
                              labelText: "password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) => forgot_password()));
                              },
                              child: Text("Forgot Password?"),
                              style:
                                  TextButton.styleFrom(primary: Colors.black)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async
                              {
                                if (formkey.currentState!.validate()) {
                                  FirebaseAuthHelper
                                      .firebaseAuthHelper
                                      .login(Users(
                                    email: EmailController.text,
                                    password: PasswordController.text,
                                  ));

                                  if(await FirebaseAuth.instance.currentUser != null){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => home()));
                                }
                                }
                              },
                              child: Text("LOG IN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(25)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.cyan),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do not have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => register()));
                      },
                      child: Text("sign up"),
                      style: TextButton.styleFrom(primary: Colors.cyan))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
