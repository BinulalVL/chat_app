import 'package:chat_app/Second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return Scaffold(

      body: SafeArea(
        child: ListView(
          children: [
            Container(height:height/1.7,
            child: Column(
              children: [
                Text('Register'),
              ],
            ),),
            SizedBox(
              width: width/1.12,
              height: height/16,
              child: TextField(controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'username',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
           Container(
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 40.0),
                   child: Text('Click here to login!'),
                 ),
                 TextButton(onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => SecondPage(name: nameController.text),
                     ),
                   );
                 },
                     child: Text('Login'))

               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
