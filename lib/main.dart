import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan,
        accentColor: Colors.yellow,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic
          )
        )
      ),
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
