// ignore_for_file: prefer_const_constructors, unused_import, deprecated_member_use, avoid_print, library_private_types_in_public_api, unused_field, unnecessary_import
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


class LocalNotificationService {
  static void display(RemoteMessage message) {}
}

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool _showNotification = true;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  FirebaseMessaging get messaging => FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
// Subscribe to the "unknown_person_notification" topic
  FirebaseMessaging.instance.subscribeToTopic('unknown_person_notification');
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.display(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "myfont",
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(35, 17, 44, 0.612)),
                ),
                SizedBox(height: 60),
                if (_showNotification)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                    






                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.notification_important),
                        SizedBox(width: 77),
                        Text('You have a new notification!'),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _showNotification = false;
                            });
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: 290,
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/homepage");
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 174, 162, 164),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width *
                      0.1, // change button width here
                  20, // change button height here
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.home),
                  SizedBox(width: 4),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showNotification = true;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.5),
        ),
        backgroundColor: Color.fromARGB(255, 207, 188, 212),
        child: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
    );
  }
}
