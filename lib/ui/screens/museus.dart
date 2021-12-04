// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter/material.dart';

class Museus extends StatefulWidget {
  const Museus({Key? key}) : super(key: key);

  @override
  _MuseusState createState() => _MuseusState();
}

class _MuseusState extends State<Museus> {
  @override
  Widget build(BuildContext context) {
    return /* const */ Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 220),
            child: Text(
              "Dino Museus",
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: Center(
        child: Text(
          "MUSEUS",
          style: TextStyle(color: Colors.green, fontSize: 30),
        ),
      ),
    );
  }
}
