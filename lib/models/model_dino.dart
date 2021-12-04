import 'package:flutter/foundation.dart';

@immutable
class DinoModel {
  const DinoModel({
    required this.nome,
    required this.classe,
    required this.filo,
    required this.periodo,
    required this.descricao,
    required this.dataDescoberta,
  });

  final String nome;
  final String classe;
  final String descricao;
  final String filo;
  final String periodo;
  final String dataDescoberta;
}
