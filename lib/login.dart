import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final FirebaseAuth auth;

  const Login({this.auth});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailFieldText = TextEditingController();
  final passwordFieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Text('Login'),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
            ),
            controller: emailFieldText,
          ),
        ],
      )
    );
  }
}