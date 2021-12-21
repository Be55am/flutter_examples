import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productivity Timer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Productivity Timer'),
        ),
        body: Container(
          child: AppBody(),
        ),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int _start = 30;
  int _total = 30;
  String startOrStop = 'STOP';
  static final oneSec = const Duration(seconds: 1);

  Timer _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Flex(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            onPressed: () {
                              startTimer(1500);
                            },
                            child: Text('Work'),
                          ))),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightGreen),
                            ),
                            onPressed: () {
                              startTimer(300);
                            },
                            child: Text('Short Breake'),
                          ))),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              startTimer(900);
                            },
                            child: Text('Long Breake'),
                          ))),
                ]),
            Expanded(
              child: new CircularPercentIndicator(
                radius: 180.0,
                lineWidth: 10.0,
                percent: _start / _total,
                center: new Text(
                  getTimeString(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                progressColor: Colors.green,
              ),
            ),
            Flex(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            onPressed: () {
                              stopTimer();
                            },
                            child: Text(startOrStop),
                          ))),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(2),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              restartTimer();
                            },
                            child: Text('Restart'),
                          ))),
                ]),
          ],
        ));
  }

  String getTimeString() {
    final int hour = _start ~/ 60;
    final int minutes = _start % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }

  void stopTimer() {
    if (_timer.isActive) {
      setState(() {
        startOrStop = 'Continue';
      });
      _timer.cancel();
    } else {
      setState(() {
        startOrStop = 'STOP';
      });
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) {
          if (_start == 0) {
            setState(() {
              timer.cancel();
            });
          } else {
            setState(() {
              _start--;
            });
          }
        },
      );
    }
  }

  void restartTimer() {
    startTimer(_total);
  }

  void startTimer(int start) {
    setState(() {
      _start = start;
      _total = start;
    });
    _timer.cancel();
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
