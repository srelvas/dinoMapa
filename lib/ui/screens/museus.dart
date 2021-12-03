import 'package:flutter/material.dart';

class Museus extends StatefulWidget {
  const Museus({Key? key}) : super(key: key);

  @override
  _MuseusState createState() => _MuseusState();
}

class _MuseusState extends State<Museus> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("MUSEUS", style: TextStyle(color: Colors.green, fontSize: 30)));
  }
}
