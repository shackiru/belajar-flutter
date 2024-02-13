import 'package:flutter/material.dart';
import 'package:flutterfirebase/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  MyUser? _userFromFirebaseUser(User user)
  {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user 
  {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }

  // sign in anon
  Future signInAnon() async
  {
    try
    {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  // sing in with email and password

  // register with email and password

  // sign out
  Future signOut() async
  {
    try
    {
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}