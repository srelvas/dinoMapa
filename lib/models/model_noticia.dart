import 'package:flutter/material.dart';

@immutable
class NoticiaModel {
  const NoticiaModel({
    required this.titulo,
    required this.imagem,
    required this.subtitulo,
    required this.data,
    required this.texto,
    required this.visivel,
    required this.cor,
  });

  final String titulo;
  final String imagem;
  final String subtitulo;
  final String data;
  final String texto;
  final bool visivel;
  final Color cor;
}
