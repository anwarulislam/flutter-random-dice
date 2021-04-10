import 'package:flutter/material.dart';
import 'package:tenms/constants.dart';
import 'package:wakelock/wakelock.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.green, body: DiceArea()),
    );
  }
}

class DiceArea extends StatefulWidget {
  @override
  _DiceAreaState createState() => _DiceAreaState();
}

class _DiceAreaState extends State<DiceArea> {
  int leftDice = 1;
  int rightDice = 1;

  changeStateOfDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeStateOfDice();
              },
              child: Image.asset('assets/images/dice$leftDice.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeStateOfDice();
              },
              child: Image.asset('assets/images/dice$rightDice.png'),
            ),
          ),
        ],
      ),
    );
  }
}
