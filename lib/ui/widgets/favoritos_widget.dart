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
          padding: EdgeInsets.all(16.0),
          child: Text(
            model.nome,
            textAlign: TextAlign.right,
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.imagemPrincipal),
              fit: BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ]);
  }
}
