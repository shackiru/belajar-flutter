import 'package:flutter/material.dart';
import 'package:flutterfirebase/services/auth.dart';

class Register extends StatefulWidget {

  final toggleView;
  const Register({Key? key, this.toggleView}) : super(key: key);  


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> 
{
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
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
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container
      (
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form
        (
          key: _formKey,
          child: Column
          (
            children: <Widget>
            [ 
              SizedBox(height: 20.0),
              TextFormField
              (
                  decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val)
                {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField
              (

                validator: (val) => val!.length < 6 ? 'Enter a password 6+ characters long' : null,
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
                  if(_formKey.currentState!.validate())
                  {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null)
                    {
                      setState(() => error = 'please supply a valid email');
                    }
                  }
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
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        )
      ),
    );
  }
}