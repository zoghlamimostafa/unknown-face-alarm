// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, camel_case_types, deprecated_member_use, unused_label
import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  const Text(
                    "Home page",
                    style: TextStyle(
                      fontSize: 29,
                      fontFamily: "myfont",
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(35, 17, 44, 0.612)
                    ),
                  ),
                  SizedBox(height: 100),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/notifications');
                    },
                    icon: Icon(Icons.notifications),
                    label: Text('Notifications'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 183, 177, 178)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 80, vertical: 16)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 17),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/unkownfaces');
                    },
                    icon: Icon(Icons.warning_amber_sharp),
                    label: Text('Unknown faces'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 183, 177, 178)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 80, vertical: 16)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 17),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/recognizedfaces');
                    },
                    icon: Icon(Icons.face),
                    label: Text('Recognized faces'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 183, 177, 178)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 80, vertical: 16)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                    icon: Icon(Icons.logout),
                    label: Text(' '),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(144, 7, 144, 0.443),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),
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
                width: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
