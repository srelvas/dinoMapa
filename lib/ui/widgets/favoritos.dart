// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_favoritos.dart';
import 'package:flutter/material.dart';

class FavoritosWidget extends StatelessWidget {
  const FavoritosWidget({Key? key, required this.model}) : super(key: key);

  final FavoritosModel model;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Text(model.nome),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(model.imagem),
          ),
        ),
      ),
    ]);
  }
}
