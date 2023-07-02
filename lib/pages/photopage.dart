// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, deprecated_member_use, sort_child_properties_last, avoid_print, body_might_complete_normally_catch_error, duplicate_ignore

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({Key? key}) : super(key: key);

  @override
  _ImagesPageState createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final List<Map<String, dynamic>> _imageFiles = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final directory = await getApplicationDocumentsDirectory();
    final images = await directory
        .list()
        .where((entity) => entity is File && entity.path.endsWith('.jpg'))
        .map<Map<String, dynamic>>((entity) => {
              'file': File(entity.path),
              'name': entity.path.split('/').last.split('.').first,
              'url': '',
            })
        .toList();
    setState(() {
      _imageFiles.addAll(images);
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File(pickedFile.path);
      final fileName = pickedFile.path.split('/').last;
      final filePath = '${directory.path}/$fileName';
      await file.copy(filePath);

      // Upload the image to Firebase Storage
      final Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('attendace/image_folder/$fileName');
      final UploadTask uploadTask = firebaseStorageRef.putFile(file);
      final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() {});
      // ignore: unused_local_variable
      final String url = await downloadUrl.ref.getDownloadURL();

      // setState(() {
      //   _imageFiles.add({'file': File(filePath), 'name': '', 'url': url});
      // });
    }
  }

  Future<void> _deleteImage(int index) async {
    final file = _imageFiles[index]['file'] as File;
    final fileName = _imageFiles[index]['name'] ?? '';
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('attendace/image_folder/$fileName.jpg');

    try {
      // Delete the image from Firebase Storage
      await firebaseStorageRef.delete();

      // Delete the image from local device storage
      await file.delete();

      setState(() {
        _imageFiles.removeAt(index);
      });
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
        backgroundColor: Color.fromARGB(198, 148, 139, 153),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _imageFiles.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final String fileName = _imageFiles[index]['name'] ?? '';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(
                      _imageFiles[index]['file'],
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteImage(index),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter a name'),
                onChanged: (value) {
                  setState(() {
                    _imageFiles[index]['name'] = value;
                  });
                },
                controller: TextEditingController(text: fileName),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.5),
        ),
        backgroundColor: Color.fromARGB(255, 207, 188, 212),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
