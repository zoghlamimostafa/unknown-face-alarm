// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, file_names, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'photopage.dart';

class Recognizedfaces extends StatelessWidget {
  const Recognizedfaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/main_top.png",
            width: MediaQuery.of(context).size.width * 0.3,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Ajout de la propriété de centrage vertical
              children: [
                Text(
                  "Recognized faces",
                  style: TextStyle(
                      fontSize: 29,
                      fontFamily: "myfont",
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(35, 17, 44, 0.612)),
                ),
                SizedBox(height: 55),
                Text(
                  "To add or delete a recognized face please click the button",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Afficher la page des photos
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagesPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Container(
                    width: 120, // Nouvelle largeur du bouton
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Ajout de la propriété de centrage horizontal
                      children: [
                        Icon(Icons.image, size: 18),
                        SizedBox(width: 10),
                        Text('Images',
                            style: TextStyle(
                                fontSize: 18,
                                color:
                                    Colors.white)), // Nouvelle taille de police
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        30), // Ajout d'un SizedBox pour séparer le bouton de l'image
                SizedBox(
                  height: 50,
                  child: Image.asset(
                    "assets/images/personne.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/homepage");
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 174, 162, 164),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
