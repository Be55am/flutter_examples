import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function() delete;


  QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: Card(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('"${quote.text}"',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
              ),
            ),
            subtitle: Text('- ${quote.author}.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey[400],
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: delete,
            ),
          ),
        ),
      ),
    );
  }
}

