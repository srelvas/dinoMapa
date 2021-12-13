// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

class DinoStore extends ChangeNotifier {
  late List<DinoModel> todos;
  late List<DinoModel> favoritos;

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
    required this.dieta,
    required this.lat,
    required this.long,
    required this.sitioDescoberta,
    required this.index,
    required this.imagemPrincipal,
    required this.tituloImagem1,
    required this.imagem1,
    required this.tituloImagem2,
    required this.imagem2,
    required this.taxonomyEvolutionImage,
    required this.isDino,
    required this.isBlack,
    required this.nameBig,
    required this.dietBig,
  });

  final String nome;
  final String classe;
  final String? ordem;
  final String filo;
  final String intervalo;
  bool isfavorito;
  final String dieta;
  final double lat;
  final double long;
  final String sitioDescoberta;
  final int index;
  final String imagemPrincipal;
  final String tituloImagem1;
  final String imagem1;
  final String tituloImagem2;
  final String imagem2;
  final String taxonomyEvolutionImage;
  bool isDino;
  bool isBlack;
  bool nameBig;
  bool dietBig;
}
