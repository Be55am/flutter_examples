import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(101),
              width: 200,
              height: 200,
              // child: FlutterLogo(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'http://bit.ly/flutter_tiger'),
                  fit: BoxFit.scaleDown,
                ),
                // color: Colors.red,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue, Colors.green],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Text('Made by Bessam'),
            Text('With Love'),
          ],
        )
      ),
    );
  }
}
