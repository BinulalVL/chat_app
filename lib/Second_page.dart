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
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
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
                  return ListView.builder(
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
                            padding: EdgeInsets.all(10)
                            ,margin: EdgeInsets.all(15),

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
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(10.0),
        child: Row(children: [
          Expanded(
              child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintText: 'Message'),
          )),
          ElevatedButton(
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
              child: Text('send'))
        ]),
      ),
    );
  }
}
