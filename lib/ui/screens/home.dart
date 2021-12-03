// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:dino_mapa/ui/screens/favoritos.dart';
import 'package:dino_mapa/ui/screens/feed.dart';
import 'package:dino_mapa/ui/screens/galeria.dart';
import 'package:dino_mapa/ui/screens/mapa.dart';
import 'package:dino_mapa/ui/screens/museus.dart';
import 'package:dino_mapa/ui/screens/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String email;
  Home(@required this.email, {Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 2;

  // ignore: prefer_final_fields
  late List<Widget> _pages = [
    Favoritos(),
    Noticias(),
    Mapa(widget.email),
    Galeria(),
    Museus(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
            index: _currentIndex, children: _pages), // para manter o estado, qql coisa tirar e meter apenas body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 13.0,
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          selectedItemColor: Color(0XFFF75701),
          unselectedItemColor: Color(0XFF7A7D80),
          selectedLabelStyle: TextStyle(
            color: Color(0XFFF75701),
          ),
          unselectedLabelStyle: TextStyle(
            color: Color(0XFFF75701),
          ),
          currentIndex: _currentIndex,
          onTap: (int index) => {onTapped(index)},
          items: [
            BottomNavigationBarItem(
              label: "Favoritos",
              icon: Icon(
                MyFlutterApp.star_2,
              ),
            ),
            BottomNavigationBarItem(
              label: "Noticias",
              icon: Icon(
                MyFlutterApp.feed,
              ),
            ),
            BottomNavigationBarItem(
              label: "Mapa",
              icon: Icon(
                MyFlutterApp.mapa,
              ),
            ),
            BottomNavigationBarItem(
              label: "Galeria",
              icon: Icon(
                MyFlutterApp.galeria,
              ),
            ),
            BottomNavigationBarItem(
              label: "Museus",
              icon: Icon(
                MyFlutterApp.museu,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
