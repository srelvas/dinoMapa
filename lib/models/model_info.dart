import 'package:flutter/foundation.dart';

@immutable
class InfoModel {
  const InfoModel({required this.evolucao, required this.tamanho});

  final String tamanho;
  final String evolucao;
}
