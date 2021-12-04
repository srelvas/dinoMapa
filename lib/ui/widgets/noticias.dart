// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:flutter/material.dart';

class NoticiaWidget extends StatelessWidget {
  const NoticiaWidget({Key? key, required this.model}) : super(key: key);

  final NoticiaModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        model.visivel
            ? Column(
                children: [
                  Text(
                    model.data,
                  ),
                  SizedBox(height: 5),
                ],
              )
            : SizedBox(height: 4), //TODO ver o tamanho para separar quando nao tem data
        Container(
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.imagem),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        // Container(height: 2), // TODO: DPS VER ISTO
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: model.cor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 7.0,
                    left: 7.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: Text(
                    model.titulo,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
