import 'package:flutter/material.dart';

import '../model/UsersModel.dart';
import '../services/FirebaseAuthHelper.dart';
import 'login.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  TextEditingController EmailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image(
                image: AssetImage('assets/graphic.png'),
              ),
            ),
            Text("Forgot your password?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Text(
                "Enter your register email address below to receive your password reset ",
                style: TextStyle(
                  color: Colors.grey,
                )),
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
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                  .hasMatch(EmailController.value.text)) {
                                return "you must enter email";
                              }
                            }
                          },
                          controller: EmailController,
                          obscureText: false,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: "Email Address",
                              labelText: "Email Address",
                              border: OutlineInputBorder(
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
                                  FirebaseAuthHelper.firebaseAuthHelper
                                      .resetPassword(Users(
                                    email: EmailController.text.trim(),
                                  ));
                                }
                              },
                              child: Text("SEND",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(25)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xffe18eaa)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  )))
                              // style: ElevatedButton.styleFrom(side: BorderRadius.circular(50.0),backgroundColor: Colors.pinkAccent , ),
                              ),
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
                  Text("Remember password? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => login()));
                      },
                      child: Text("Login Now"),
                      style: TextButton.styleFrom(primary: Color(0xffbead15)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
