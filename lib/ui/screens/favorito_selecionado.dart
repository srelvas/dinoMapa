// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:dino_mapa/models/model_favoritos.dart';
import 'package:dino_mapa/models/model_info.dart';
import 'package:dino_mapa/ui/widgets/info.dart';
import 'package:flutter/material.dart';

class FavoritoSelecionado extends StatefulWidget {
  final FavoritosModel fav;
  const FavoritoSelecionado({Key? key, required this.fav}) : super(key: key);

  @override
  _FavoritoSelecionadoState createState() => _FavoritoSelecionadoState();
}

class _FavoritoSelecionadoState extends State<FavoritoSelecionado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title:
                  Image.asset(
                  widget.fav.imagem,
                  fit: BoxFit.fitWidth,
                  //height: 100,

          )
      ), */
      backgroundColor: Color(0xFFF2F3F8),
      body: Stack(
        children: [
          Image(
            image: AssetImage(widget.fav.imagem),
            fit: BoxFit.cover,
            height: 500,
            width: 500,
            alignment: Alignment.center,
          ),
          /*  Container(
            /* Image.asset(
              widget.fav.imagem,
              fit: BoxFit.fitWidth,
            ) */
            /* decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.fav.imagem),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ), */
          ) */
          Center(
            child: Column(
              children: [
                Container(
                    //color: Color(0x00c5cdd5),
                    height: 500,
                    alignment: Alignment.center,
                    child: Text(widget.fav.nome, style: TextStyle(color: Colors.red, fontSize: 30)))
              ],
            ),
          ),
          DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Stack(
              children: <Widget>[
                Scaffold(
                  bottomNavigationBar: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12, //TODO: IDK HOW I FEEL ABOUT THIS SHADOW LOL
                          blurRadius: 15.0,
                        )
                      ],
                    ),
                    child: TabBar(
                      unselectedLabelColor: Colors.redAccent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      tabs: <Widget>[
                        Tab(
                          height: 62,
                          text: "Info",
                          // icon: Icon(
                          //   MyFlutterApp.star_2,
                          //   size: 35,
                          // ),
                          // iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          height: 62,
                          text: "Taxonomia",
                          // icon: Icon(
                          //   MyFlutterApp.feed,
                          //   size: 35,
                          // ),
                          // iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                        Tab(
                          height: 62,
                          text: "Vida e evolução",
                          // icon: Icon(
                          //   MyFlutterApp.mapa,
                          //   size: 35,
                          // ),
                          // iconMargin: const EdgeInsets.only(bottom: 4, top: 4),
                        ),
                      ],
                      labelColor: Theme.of(context).primaryColor,
                      labelStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Hammersmith',
                      ),
                      indicatorColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      InfoWidget(model: widget.fav.info),
                      InfoWidget(model: widget.fav.info),
                      InfoWidget(model: widget.fav.info),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
