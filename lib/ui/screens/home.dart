// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:animations/animations.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GaleriaStore(
              [
                GaleriaModel(
                  data: "31/10/2021",
                  dinossauro: 'Dinheirosaurus lourinhanensis',
                  descricao: 'Tirei esta foto no museu da Lourinhã. Foi descoberto em Portugal pelo paleontólogo Octávio Mateus!!',
                  imagem: "assets/images/dino_dinheirosaurus.jpeg",
                ),

              ],[
                GaleriaModel(
                  dinossauro: 'Dinheirosaurus lourinhanensis',
                ),
                 GaleriaModel(
                  dinossauro: 'dino 2',
                ),
                GaleriaModel(
                  dinossauro: 'dino 3',
                ),
                GaleriaModel(
                  dinossauro: 'dino 4',
                ),                                               
              ],
            ) ,
          ),
        ],
        child: SafeArea(
            child: Scaffold(
          // body: PageTransitionSwitcher(
          //     child: _pages[_currentIndex],
          //     transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          //         FadeThroughTransition(animation: primaryAnimation, secondaryAnimation: secondaryAnimation, child: child)), // NAO GOSTO DESTA ANIMACAO MUDAR
          // bottomNavigationBar: BottomNavigationBar(
          //   selectedFontSize: 13.0,
          //   type: BottomNavigationBarType.fixed,
          //   iconSize: 35,
          //   selectedItemColor: Color(0XFFF75701),
          //   unselectedItemColor: Color(0XFF7A7D80),
          //   selectedLabelStyle: TextStyle(
          //     color: Color(0XFFF75701),
          //   ),
          //   unselectedLabelStyle: TextStyle(
          //     color: Color(0XFFF75701),
          //   ),
          //   currentIndex: _currentIndex,
          //   onTap: (int index) => {onTapped(index)},
          //   items: [
          //     BottomNavigationBarItem(
          //       label: "Favoritos",
          //       icon: Icon(
          //         MyFlutterApp.star_2,
          //         size: 34,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: "Noticias",
          //       icon: Icon(
          //         MyFlutterApp.feed,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: "Mapa",
          //       icon: Icon(
          //         MyFlutterApp.mapa,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: "Galeria",
          //       icon: Icon(
          //         MyFlutterApp.galeria,
          //       ),
          //     ),
          //     BottomNavigationBarItem(
          //       label: "Museus",
          //       icon: Icon(
          //         MyFlutterApp.museu,
          //         size: 34,
          //       ),
          //     ),
          //   ],
          // ),
          body: DefaultTabController(
            initialIndex: 2,
            length: 5,
            child: Stack(
              children: <Widget>[
                Scaffold(
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black12, //TODO: IDK HOW I FEEL ABOUT THIS SHADOW LOL
                        blurRadius: 15.0,
                      )
                    ]),
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      tabs: <Widget>[
                        Tab(
                          height: 62,
                          text: "Favoritos",
                          icon: Icon(
                            MyFlutterApp.star_2,
                            size: 35,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          height: 62,
                          text: "Noticias",
                          icon: Icon(
                            MyFlutterApp.feed,
                            size: 35,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          height: 62,
                          text: "Mapa",
                          icon: Icon(
                            MyFlutterApp.mapa,
                            size: 35,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          text: "Galeria",
                          height: 62,
                          icon: Icon(
                            MyFlutterApp.galeria,
                            size: 36,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          text: "Museus",
                          height: 62,
                          icon: Icon(
                            MyFlutterApp.museu,
                            size: 34,
                          ),
                          iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                      ],
                      labelColor: Theme.of(context).primaryColor,
                      labelStyle: TextStyle(
                        fontSize: 12,
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
        )));
  }

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
