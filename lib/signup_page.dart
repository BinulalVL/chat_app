import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  Future<void>loginUser (String email,String password)async{
  try{ await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }catch(e){
      print("Error:$e");
  }
}

TextEditingController signincontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();
  var email;
var password;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: signincontroller,
          ),
          TextField(
            controller: passwordcontroller,
          ),
          ElevatedButton(onPressed: () {
            email=signincontroller.text;
            password=passwordcontroller.text;
            loginUser(email, password);

          }, child: Text('Login'))
        ],
      ),
    );
  }
}
