import 'package:flutter/foundation.dart';

@immutable
class DinoModel {
  const DinoModel({
    required this.nome,
    required this.classe,
    required this.descricao,
    required this.dataDescoberta,
  });

  final String nome;
  final String classe;
  final String descricao;
  final DateTime dataDescoberta;
}
