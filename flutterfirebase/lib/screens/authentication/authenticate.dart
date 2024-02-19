import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/authentication/register.dart';
import 'package:flutterfirebase/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView()
  {
    setState(() => showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn)
    {
      return SignIn();
    }
    else
    {
      return Register();
    }
  }
}