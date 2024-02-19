import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/authentication/register.dart';
import 'package:flutterfirebase/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  toggleView()
  {
    setState(() => showSignIn = !showSignIn);
  }
  @override
  
  Widget build(BuildContext context) {
    if(showSignIn)
    {
      return SignIn(toggleView: toggleView);
    }
    else
    {
      return Register(toggleView: toggleView);
    }
  }
}