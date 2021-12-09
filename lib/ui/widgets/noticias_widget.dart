// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, file_names
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:flutter/material.dart';

class NoticiaWidget extends StatelessWidget {
  const NoticiaWidget({Key? key, required this.model, required this.index}) : super(key: key);

  final NoticiaModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          model.visivel
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        model.data,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                )
              : SizedBox(height: 10),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(model.imagem),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: kElevationToShadow[6],
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
              SizedBox(height: index == 3 ? 30 : 0)
            ],
          ),
        ],
      ),
    );
  }
}
