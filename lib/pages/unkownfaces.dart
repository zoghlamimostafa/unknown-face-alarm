// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Unknownfaces extends StatefulWidget {
  const Unknownfaces({Key? key}) : super(key: key);

  @override
  _UnknownfacesState createState() => _UnknownfacesState();
}

class _UnknownfacesState extends State<Unknownfaces> {
  late Future<List<String>> _imageUrlsFuture;
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _imageUrlsFuture = loadImages();
  }

  Future<List<String>> loadImages() async {
    try {
      ListResult result = await storage.ref().listAll();
      List<Reference> allFiles = result.items;
      List<String> urls = [];
      for (Reference ref in allFiles) {
        String downloadUrl = await ref.getDownloadURL();
        urls.add(downloadUrl);
      }
      return urls;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<List<String>>(
            future: _imageUrlsFuture,
            builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error loading images');
              } else {
                List<String> urls = snapshot.data!;
                if (urls.isEmpty) {
                  return Center(
                    child: Text(
                      "Unknown faces",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "myfont",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  );
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Nombre de colonnes souhaité
                    crossAxisSpacing: 8.0, // Espace entre les colonnes
                    mainAxisSpacing: 8.0, // Espace entre les lignes
                  ),
                  itemCount: urls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      urls[index],
                      fit: BoxFit.cover,
                    );
                  },
                );
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/homepage");
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 174, 162, 164),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    
                    
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



