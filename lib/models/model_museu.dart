import 'package:flutter/foundation.dart';

@immutable
class MuseuModel {
  const MuseuModel({
    required this.horario,
    required this.precos,
    required this.morada,
  });

  final String horario;
  final String precos;
  final String morada;
}
