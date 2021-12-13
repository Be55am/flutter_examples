import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello layouts')),
        body: Center(
          child: Text(
            'Hello flutter layouts!',
            style: TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('You rang ?');
          },
          child: Icon(Icons.lightbulb_outline),
        ),
        persistentFooterButtons: [
          IconButton(
              onPressed: () {
                print('comment');
              },
              icon: Icon(Icons.add_comment)),
          IconButton(
              onPressed: () {
                print('like');
              },
              icon: Icon(Icons.add_alarm)),
          IconButton(
              onPressed: () {
                print('share');
              },
              icon: Icon(Icons.add_location))
        ],
      ),
    );
  }
}
