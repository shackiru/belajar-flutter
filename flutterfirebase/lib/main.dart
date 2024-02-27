import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutterfirebase/services/auth.dart';
import 'package:flutterfirebase/models/user.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
    catchError: (_, __) => null,
    value: AuthService().user,
    initialData: null,
    child: const MaterialApp
      (
      home: Wrapper(),
      ),
    );
  }
}
