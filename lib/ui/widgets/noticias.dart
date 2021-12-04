// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:flutter/material.dart';

class NoticiaWidget extends StatelessWidget {
  const NoticiaWidget({Key? key, required this.model}) : super(key: key);

  final NoticiaModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // fazer trenario com visivel ? column : null
        // sizedbox
        //se houver data queremos sizedbox senao nao queremos
        Container(
          child: Text(model.titulo), //imagem
        ),
        // separador
        Container(
          decoration: BoxDecoration(color: model.cor),
          child: Text(model.titulo),
        ),
      ],
    );
  }
}
