import 'package:chat_app/counder_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(),
        Consumer<counterModel>(builder: (BuildContext context, value, Widget? child) { return Text(value.counter.toString()); }),

          ElevatedButton(onPressed: () {
            Provider.of<counterModel>(context,listen: false).increment();
          }, child: Text('pressme'))
        ],
      ),
    );
  }
}
