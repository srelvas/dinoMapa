// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class DinoStore extends ChangeNotifier {
  late List<DinoModel> todos;
  late List<DinoModel> favoritos; // idk

  DinoStore(List<DinoModel> t, List<DinoModel> f) {
    todos = t;
    favoritos = f;
  }

  void setFav(int index) {
    todos.elementAt(index).isfavorito = !todos.elementAt(index).isfavorito;
    if (todos.elementAt(index).isfavorito) {
      favoritos.add(todos.elementAt(index));
    }
    if (!todos.elementAt(index).isfavorito) {
      favoritos.remove(todos.elementAt(index));
    }
    notifyListeners();
  }
}

class DinoModel {
  DinoModel({
    required this.nome,
    required this.classe,
    required this.filo,
    required this.intervalo,
    this.ordem,
    required this.isfavorito,
    required this.lat,
    required this.long,
    required this.sitioDescoberta,
    required this.index,
    required this.imagemPrincipal,
  });

  final String nome;
  final String classe;
  final String? ordem;
  final String filo;
  final String intervalo;
  bool isfavorito;
  final double lat;
  final double long;
  final String sitioDescoberta;
  final int index;
  final String imagemPrincipal;
}
