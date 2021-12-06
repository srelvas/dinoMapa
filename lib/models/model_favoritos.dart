import 'package:dino_mapa/ui/widgets/info.dart';
import 'package:flutter/foundation.dart';
import 'model_info.dart';

@immutable
class FavoritosModel {
  const FavoritosModel({
    required this.imagem,
    required this.nome,
    required this.isFavorite,
    required this.info,
    // required this.taxonomy,
    // required this.vidaextincao,
  });

  final String nome;
  final String imagem;
  final bool isFavorite;
  final InfoModel info;
}
