import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Second_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void>loginUser(String email,String password)async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      var nameController;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(name: 'hi'),
        ),
      );
    }
    catch (e) {
      print('Error:$e');
    }
  }
 TextEditingController emailcontroller= TextEditingController();
 TextEditingController passwordcontroller= TextEditingController();
 var email;
 var password;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailcontroller,
          ),
          TextField(
            controller: passwordcontroller,
          ),
          ElevatedButton(onPressed: () {
            email=emailcontroller.text;
            password=passwordcontroller.text;
            loginUser(email, password);

          }, child: Text('Login'))
        ],
      ),
    );
  }
}
