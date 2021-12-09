// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/dinoStore.dart';
import 'package:flutter/material.dart';

class FavoritosWidget extends StatelessWidget {
  const FavoritosWidget({Key? key, required this.model}) : super(key: key);

  final DinoModel model;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 140,
        width: 320,
        child: Padding(
          padding: EdgeInsets.only(top: 6, right: 11),
          child: Text(
            model.nome,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
        decoration: BoxDecoration(
            boxShadow: kElevationToShadow[6],
            image: DecorationImage(
              image: AssetImage(model.imagemPrincipal),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ]);
  }
}
