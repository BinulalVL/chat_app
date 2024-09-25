import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  String? name;
  SecondPage({super.key, this.name});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   scrollToBottom();
  //   super.initState();
  // }
  @override

  ScrollController _scrollController = ScrollController();
  TextEditingController controller = TextEditingController();
  int value = 0;
  var msg;
  var length;


  void push() {
    value++;
    var data = FirebaseFirestore.instance.collection('Users').add({
      'name': widget.name,
      'text': msg,
      'timeStamp': FieldValue.serverTimestamp(),
    });
  }

  void scrollToBottom() {
    _scrollController.animateTo(0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      controller.clear();
      scrollToBottom();
    }
  }

  void clearMessage() {
    if (controller.text.isEmpty) {
      scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      //resizeToAvoidBottomInset: false,

      appBar: AppBar(title: Text(widget.name!)),
      body: ListView(
        children: [
          Container(
            height: height/1.28,
           // color: Colors.blue,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .orderBy('timeStamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<DocumentSnapshot> document = snapshot.data!.docs;
                  document=document.reversed.toList();
                  return ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: document.length,
                    padding:EdgeInsets.all(20) ,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment:
                            document[index]['name'] == widget.name
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8)
                            ,margin: EdgeInsets.only(right:5),

                            constraints:BoxConstraints(maxWidth: width*0.7) ,
                            decoration: BoxDecoration(
                              color: document[index]['name'] == widget.name
                                  ? Colors.green
                                  : Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  document[index]['name'],
                                ),
                                Text(document[index]['text']),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0,left: 8,right: 5),
            child: Container(
              child: Row(children: [
                Expanded(
                    child: SizedBox(
                      height: height/16,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            hintText: 'Message'),
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      msg = controller.text;
                      print(msg);

                      setState(() {
                        scrollToBottom();
                        sendMessage();
                        clearMessage();
                      });

                      push();
                    },
                    icon:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.send),
                    )),

              ]),
            ),
          )
        ],
      ),
    );
  }
}
