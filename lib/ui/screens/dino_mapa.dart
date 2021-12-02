// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:dino_mapa/ui/widgets/menu.dart';
import 'package:flutter/material.dart';

class DinoMapa extends StatefulWidget {
  final String email;
  DinoMapa(@required this.email, {Key? key}) : super(key: key);

  @override
  _DinoMapaState createState() => _DinoMapaState();
}

class _DinoMapaState extends State<DinoMapa> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: Menu(widget.email),
          body: Center(
              child: Column(
            children: [
              IconButton(
                icon: Icon(IconData(58332, fontFamily: 'MaterialIcons')),
                onPressed: () => _key.currentState!.openDrawer(),
              ),
              Text("ola", style: TextStyle(color: Colors.red)),
            ],
          ),),
      ),
    );
  }
}
