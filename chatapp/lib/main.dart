import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/screens/chats.dart';
import 'package:chatapp/screens/calls.dart';
import 'package:chatapp/screens/people.dart';
import 'package:chatapp/screens/settings.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/screens/home_page.dart';
import 'package:chatapp/screens/login/hello.dart';
import 'dart:io' show Platform;

const bool USE_EMULATOR = true;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  if(USE_EMULATOR)
  {
    _connectToFirebaseEmulator();
  }
}

Future _connectToFirebaseEmulator() async
{
  final fireStorePort = "1000";
  final authPort = "9099";
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
    host: '$localHost:$fireStorePort',
    sslEnabled: false,
    persistenceEnabled: false,
  );

  await FirebaseAuth.instance.useEmulator('http://$localHost:$authPort');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
     home: Hello(),
     theme: CupertinoThemeData(
      brightness: Brightness.light, primaryColor: Color(0xFF08C187)),
    );
  }
}
