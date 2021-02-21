import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final FirebaseAuth auth;

  const Register({this.auth});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final emailFieldText = TextEditingController();
  final passwordFieldText = TextEditingController();

  void register() async {
    debugPrint('register');
    debugPrint(emailFieldText.text);
    try {
      UserCredential userCredential = await widget.auth.createUserWithEmailAndPassword(
        email: emailFieldText.text,
        password: passwordFieldText.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for the email');
      }
    } catch (e) {
      debugPrint(e);
    }
  }

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
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
            ),
            controller: passwordFieldText,
          ),
          IconButton(icon: Icon(Icons.add), onPressed: register)
        ],
      )
    );
  }
}