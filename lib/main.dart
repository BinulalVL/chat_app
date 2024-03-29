import 'package:chat_app/counder_provider.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/provider_class.dart';
import 'package:chat_app/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


import 'HomePage.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => counterModel(),
      child: MaterialApp(
        home:HomePage(),
      ),
    );
  }
}
