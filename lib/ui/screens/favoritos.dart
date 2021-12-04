// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_favoritos.dart';
import 'package:dino_mapa/ui/widgets/favoritos.dart';
import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  List<FavoritosModel> favs = [
    FavoritosModel(
      imagem: 'assets/images/logo.png',
      nome: 'dino',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return /* const */ Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 150),
            child: Text(
              "Dino Favoritos",
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: //Center(child: Text("FAVORITOS", style: TextStyle(color: Colors.red, fontSize: 30))));
          Column(children: [
        Expanded(
            child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: favs.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              //color: Colors.amber[colorCodes[index]],
              child: FavoritosWidget(model: favs[index]),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ))
        // TODO: SE TIVER TEMPO TRANSFORMAR EM SLIDER
      ]),
    );
  }
}
