import 'package:flutter/material.dart';
import 'package:flutterfirebase/services/auth.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> 
{
final AuthService _authService = AuthService();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.brown[100],
      appBar: AppBar
      (
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register to Brew Crew'),
        actions: <Widget>
        [
          ElevatedButton.icon
          (
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              
            },
          )
        ],
      ),
      body: Container
      (
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form
        (
          child: Column
          (
            children: <Widget>
            [
              SizedBox(height: 20.0),
              TextFormField
              (
                onChanged: (val)
                {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField
              (
                obscureText: true,
                onChanged: (val)
                {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              ElevatedButton
              (
                onPressed: () async 
                {
                  print(email);
                  print(password);
                },
                child: Text
                (
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle
              (
                textStyle: MaterialStateProperty.all
                (
                  TextStyle(color: Colors.white)
                ),
                backgroundColor: MaterialStateProperty.all
                (
                  Colors.pink[400]
                )
              )
              )
            ]
          )
        )
      ),
    );
  }
}