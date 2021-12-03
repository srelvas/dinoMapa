import 'package:flutter/foundation.dart';

@immutable
class GaleriaModel {
  const GaleriaModel({
    this.imagem,
    required this.dinossauro,
    this.descricao,
    this.data,
  });

  final String dinossauro;
  final String? imagem;
  final String? descricao;
  final String? data;

  // setImage(image) {
  //   imagem = image;
  // }
}
