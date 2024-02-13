import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/authentication/authenticate.dart';
import 'package:flutterfirebase/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutterfirebase/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<MyUser?>(context);
    print(user);
    //return either home or authenticate widget
    if(user == null)
    {
      return Authenticate();
    }
    else
    {
      return Home();
    }
  }
}