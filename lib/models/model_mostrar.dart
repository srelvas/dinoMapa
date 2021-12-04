import 'package:flutter/material.dart';

class NoticiaModel {
  NoticiaModel({
    required this.titulo,
    required this.imagem,
    required this.subtitulo,
    required this.data,
    required this.texto,
    required this.visivel,
    required this.cor,
    required this.favorito,
  });

  final String titulo;
  final String imagem;
  final String subtitulo;
  final String data;
  final String texto;
  final bool visivel;
  final Color cor;
  bool favorito;

  setFavorito(bool fav) {
    favorito = fav;
  }
}
