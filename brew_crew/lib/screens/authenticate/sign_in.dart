import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn>
{
  final AuthService _auth = AuthService();  

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async
          {
            dynamic result = await _auth.signInAnon();
            if(result == null)
            {
              print('error signing in');
            }
            else
            {
              print('signed in');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}