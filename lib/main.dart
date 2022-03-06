import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: diceRolling(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class diceRolling extends StatefulWidget {
  const diceRolling({Key? key}) : super(key: key);

  @override
  _diceRollingState createState() => _diceRollingState();
}

class _diceRollingState extends State<diceRolling> {
  int leftdice = 1;
  int rightdice = 2;

  rolldices() {
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    rolldices();
                  },
                  child: Image.asset("assets/$leftdice.png"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    rolldices();
                  },
                  child: Image.asset("assets/$rightdice.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
