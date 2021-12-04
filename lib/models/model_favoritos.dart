import 'package:flutter/foundation.dart';

@immutable
class FavoritosModel {
  const FavoritosModel({
    required this.imagem,
    required this.nome,
  });

  final String nome;
  final String imagem;
}
