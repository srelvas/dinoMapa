import 'package:flutter/foundation.dart';

@immutable
class FavoritosModel {
  const FavoritosModel({
    required this.imagem,
    required this.dinossauro,
  });

  final String dinossauro;
  final String imagem;
}
