import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StopWatch using Timer Class',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: TimerDisplay(),
    );
  }
}

class TimerDisplay extends StatefulWidget {
  @override
  _TimerDisplayState createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {
  final _biggerFont = TextStyle(fontSize: 30.0);
  bool playPressed = false;
  Stopwatch stopwatch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
        backgroundColor: Colors.red,
      ),
      body: _timecreator(),
      backgroundColor: Colors.amberAccent,
    );
  }

  Widget _timecreator() {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
              stopwatch == null ? Text("0:0:0", style: _biggerFont) : Text(stopwatch.elapsed.inHours.toString() + ':' +stopwatch.elapsed.inMinutes.toString() + ':' + stopwatch.elapsed.inSeconds.toString(), style: _biggerFont,),
            SizedBox(height: 60),
            Row(
                children: <Widget>[
                  Expanded(child: playPressed == true ? IconButton(icon: Icon(Icons.pause_circle_outline), onPressed: _pauseTimer, iconSize: 50.0) : IconButton(icon: Icon(Icons.play_circle_outline), onPressed: _startTimer,  iconSize: 50.0),
                  ),
                  Expanded(child: IconButton(icon: Icon(Icons.refresh_outlined), onPressed: _resetTimer,  iconSize: 50.0),
                  )
                ],
              )
            ]
        );
      },
    );
  }

  void _startTimer() {
    playPressed = true;
    if(stopwatch == null) {
      stopwatch = new Stopwatch();
      setState(() {
        stopwatch.start();
      });
    } else {
      if (!stopwatch.isRunning) {
        setState(() {
          stopwatch.start();
        });
      }
    }
  }

  void _pauseTimer() {
    playPressed = false;
    stopwatch.stop();
  }

  void _resetTimer() {
    playPressed = false;
    stopwatch = null;
  }
}


