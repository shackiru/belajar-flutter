import 'package:flutter/material.dart';
import 'package:flutterfirebase/services/auth.dart';

class SignIn extends StatefulWidget 
{
  final toggleView;
  const SignIn({super.key, this.toggleView});  

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> 
{
  final AuthService _authService = AuthService();
  //text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.brown[100],
      appBar: AppBar
      (
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in to Brew Crew'),
        actions: <Widget>
        [
          ElevatedButton.icon
          (
            icon: const Icon(Icons.person),
            label: const Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container
      (
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form
        (
          child: Column
          (
            children: <Widget>
            [
              const SizedBox(height: 20.0),
              TextFormField
              (
                onChanged: (val)
                {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField
              (
                obscureText: true,
                onChanged: (val)
                {
                  setState(() => password = val);
                }
              ),
              const SizedBox(height: 20.0),
              ElevatedButton
              (
                onPressed: () async 
                {
                  print(email);
                  print(password);
                },
                style: ButtonStyle
              (
                textStyle: MaterialStateProperty.all
                (
                  const TextStyle(color: Colors.white)
                ),
                backgroundColor: MaterialStateProperty.all
                (
                  Colors.pink[400]
                )
              ),
                child: const Text
                (
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                )
              )
            ]
          )
        )
      ),
    );
  }
}