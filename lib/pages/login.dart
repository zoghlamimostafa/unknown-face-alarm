// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_label, empty_statements, dead_code, library_private_types_in_public_api, unused_element, no_leading_underscores_for_local_identifiers, unused_field, duplicate_ignore, unnecessary_null_comparison, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
const Login({Key? key});

@override
Widget build(BuildContext context) {
String email = "";
String password = "";
final auth = FirebaseAuth.instance;


return SafeArea(
  child: Scaffold(
    body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 50),
                const Text(
                  "Log in",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "myfont",
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(35, 17, 44, 0.612)),
                ),
                SizedBox(height: 50),
                Image.asset(
                  "assets/images/log.png",
                  width: 60,
                ),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 179, 179),
                    borderRadius: BorderRadius.circular(66),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 210, 208, 211),
                        ),
                        hintText: "Your Email :",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 179, 179),
                    borderRadius: BorderRadius.circular(66),
                  ),
                  width: 266,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        suffix: Icon(
                          Icons.visibility,
                          color: Color.fromARGB(255, 230, 227, 233),
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 210, 208, 211),
                          size: 19,
                        ),
                        hintText: "Password :",
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final user = await auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushReplacementNamed(
                            context, '/homepage');
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Error"),
                          content: Text(e.toString()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },




                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 130, 32, 143)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "login",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                   SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      // Naviguer vers l'écran de réinitialisation du mot de passe
                      Navigator.pushNamed(context, '/resetpassword');
                    },
                    child: Text("Forgot password?"),
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");},
                                child: Text(
                                  " Sign up",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Image.asset(
                        "assets/images/main_top.png",
                        width: 90,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/login_bottom.png",
                        width: 111,
                      ),
                    ),
                  ],
                ))),
      );
    
  }
}