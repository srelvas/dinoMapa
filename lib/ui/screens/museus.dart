import 'package:flutter/material.dart';

class Museus extends StatefulWidget {
  const Museus({Key? key}) : super(key: key);

  @override
  _MuseusState createState() => _MuseusState();
}

class _MuseusState extends State<Museus> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF2F3F8), body: Center(child: Text("MUSEUS", style: TextStyle(color: Colors.green, fontSize: 30),),),);
  }
}
