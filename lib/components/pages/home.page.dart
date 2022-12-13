import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/configuration');
            },
            child: const Text('COnfiguration'))
      ])),
    );
  }
}
