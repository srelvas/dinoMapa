import 'package:flutter/foundation.dart';

@immutable
class NoticiaModel {
  const NoticiaModel({
    required this.titulo,
    required this.imagem,
    required this.subtitulo,
    required this.data,
    required this.texto,
  });

  final String titulo;
  final String imagem;
  final String subtitulo;
  final String data;
  final String texto;
}
