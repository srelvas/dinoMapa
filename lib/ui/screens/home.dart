// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:animations/animations.dart';
import 'package:dino_mapa/data/dino_data.dart';
import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/models/galeriaStore.dart';
import 'package:dino_mapa/ui/screens/favoritos.dart';
import 'package:dino_mapa/ui/screens/noticias.dart';
import 'package:dino_mapa/ui/screens/galeria.dart';
import 'package:dino_mapa/ui/screens/mapa.dart';
import 'package:dino_mapa/ui/screens/museus.dart';
import 'package:dino_mapa/ui/screens/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          body: DefaultTabController(
            initialIndex: 2,
            length: 5,
            child: Stack(
              children: <Widget>[
                Scaffold(
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15.0,
                      )
                    ]),
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      tabs: <Widget>[
                        Tab(
                          height: 52,
                          text: "Favoritos",
                          icon: Icon(
                            MyFlutterApp.star_2,
                            size: 30,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          height: 52,
                          text: "Noticias",
                          icon: Icon(
                            MyFlutterApp.feed,
                            size: 30,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          height: 52,
                          text: "Mapa",
                          icon: Icon(
                            MyFlutterApp.mapa,
                            size: 30,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          text: "Galeria",
                          height: 52,
                          icon: Icon(
                            MyFlutterApp.galeria,
                            size: 31,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          text: "Museus",
                          height: 52,
                          icon: Icon(
                            MyFlutterApp.museu,
                            size: 29,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                      ],
                      labelColor: Theme.of(context).primaryColor,
                      labelStyle: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Hammersmith',
                      ),
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      Favoritos(),
                      Noticias(),
                      Mapa(widget.email),
                      Galeria(),
                      Museus(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
