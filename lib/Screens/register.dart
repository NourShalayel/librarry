import 'package:flutter/material.dart';
import 'package:librarry/Screens/login.dart';


import '../model/UsersModel.dart';
import '../services/FirebaseAuthHelper.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();

}

class _registerState extends State<register> {
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Image(
                image: AssetImage('assets/images/book.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  key: _globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter name";
                            } else if (value.length < 5) {
                              return "name should be more than 5";
                            }
                          },                          controller: NameController,
                          obscureText: false,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              hintText: "Name",
                              labelText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0))),
                        ),
                      ),
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
                          },                          controller: EmailController,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter password";
                            } else if (value.length < 8) {
                              return " password less than 8 ";
                            }
                          },
                          controller: PasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key_outlined),
                              hintText: "Password",
                              labelText: "Password",
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
                                if (_globalKey.currentState!.validate()) {
                                Future uid =  FirebaseAuthHelper.firebaseAuthHelper.register(Users(
                                      email: EmailController.text,
                                      password: PasswordController.text,
                                      name: NameController.text));
                                if(uid != null){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                                    return login();
                                  }));
                                }

                                }
                              },
                              child: Text("REGISTER" , style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                              style: ButtonStyle(
                                  padding:
                                  MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.all(25)),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Color(0xff3f51b5)),
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
                  Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
                      },
                      child: Text("Login Now"),
                      style: TextButton.styleFrom(primary: Color(0xff3f51b5)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
