 
 
import 'package:flutter/material.dart';

import 'home_page.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items in side the order"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>const HomePage()));
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
/*
class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}*/