// ignore_for_file: unused_import, prefer_const_constructors, avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:projectone/pages/homepage.dart';
import 'package:projectone/pages/login.dart';
import 'package:projectone/pages/recognizedfaces.dart';
import 'package:projectone/pages/signup.dart';
import 'package:projectone/pages/unkownfaces.dart';
import 'package:projectone/pages/welcome.dart';
import 'package:projectone/pages/notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(MyApp());
}

Future<void> backgroundHandler(RemoteMessage message) async {
  	print(message.data.toString());
 	print(message.notification!.title);
	}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Welcome(),
        "/login": (context) => const Login(),
        "/signup": (context) => const Signup(),
        "/homepage": (context) => const Home_page(),
        "/notifications": (context) => const Notifications(),
        "/unkownfaces": (context) => const Unknownfaces(),
        "/recognizedfaces": (context) => const Recognizedfaces(),
      },
    );
  }
}
