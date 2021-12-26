import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/quote.dart';
import 'package:my_first_flutter_app/quote_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> quotes = [
    Quote(text:'The purpose of our lives is to be happy',author: 'Dalai Lama'),
    Quote(text:'Life is what happens when you’re busy making other plans',author: 'John Lennon'),
    Quote(text:'Get busy living or get busy dying',author: 'Stephen King'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes',
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'PressStart2P'

          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: quotes.map((e) => QuoteCard(
              quote: e,
              delete: () {
                setState(() {
                  print('deleting ...');
                  quotes.remove(e);
                });
              }
          )).toList()

        ),
      )
    );
  }
}
