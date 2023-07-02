// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, unused_element, avoid_print, unused_label, use_build_context_synchronously, unnecessary_import
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  Future<void> _signup() async {
    try {
      if (!isEmailValid(_emailController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please enter a valid email address."),
          ),
        );
        return;
      }
      final userCredential =
          await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      // user is signed up successfully
      print('user signed up: ${userCredential.user}');
      Navigator.pushReplacementNamed(context, '/homepage'); // Navigate to the home page
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      "Sign up",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "myfont",
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(35, 17, 44, 0.612)
                      ),
                    ),
                    SizedBox(height: 75),
                    Image.asset(
                      "assets/images/signup.PNG",
                      width: 40,
                    ),
                    SizedBox(height: 75),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 185, 179, 179),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 210, 208, 211),
                          ),
                          hintText: "Your Email :",
                          border: InputBorder.none,
                        ),
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
                        controller: _passwordController,
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
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    ElevatedButton(
  onPressed: () async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter email and password."),
        ),
      );
      return;
    }

    if (!isEmailValid(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter a valid email address."),
        ),
      );
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/homepage'); // Navigate to the home page
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The account already exists for that email."),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      Color.fromARGB(255, 130, 32, 143),
    ),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(horizontal: 106, vertical: 10),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(27),
      ),
    ),
  ),
                          child: Text(
                            "sign up",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context,  "/login" );},
                              child: Text(
                                " Log in ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 277,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                                color: Color.fromARGB(31, 9, 8, 8),
                              )),
                              Text(
                                "OR",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 75, 72, 72)),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 2,
                                color: Color.fromARGB(31, 9, 8, 8),
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Image.asset(
                      "assets/images/main_top.png",
                      width: 111,
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
