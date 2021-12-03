import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  const Noticias({Key? key}) : super(key: key);

  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF2F3F8),body: Center(child: Text("NOTICIAS", style: TextStyle(color: Colors.blue, fontSize: 30),),),);
  }
}
