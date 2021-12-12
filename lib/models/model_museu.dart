// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';

@immutable
class MuseuModel {
  MuseuModel({
    required this.horarioCompacto,
    required this.horario,
    required this.precos,
    required this.morada,
    required this.interior,
    required this.exterior,
    required this.interiorColor,
    required this.exteriorColor,
    required this.name,
    required this.expanded,
    required this.categorias,
    required this.numero,
    required this.weekdays,
    this.horarioEntradaManha,
    this.horarioSaidaManha,
    this.horarioEntradaTarde,
    this.horarioSaidaTarde,
  });

  final String name;
  final String interior;
  final String exterior;
  final int interiorColor;
  final int exteriorColor;
  final String horarioCompacto;
  final String horario;
  final String precos;
  final String morada;
  final String categorias;
  final String numero;
  final String? horarioEntradaManha;
  final String? horarioSaidaManha;
  final String? horarioEntradaTarde;
  final String? horarioSaidaTarde;
  final List<int> weekdays;
  bool expanded;

  expandPressed() {
    expanded = !expanded;
  }
}
