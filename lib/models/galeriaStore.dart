// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GaleriaStore extends ChangeNotifier {
  late List<GaleriaModel> fotos;
  late List<GaleriaModel> fotosNE;

  GaleriaStore(List<GaleriaModel> fE, List<GaleriaModel> fNE) {
    fotos = fE;
    fotosNE = fNE;
  }

  List<GaleriaModel> get listE => fotos;
  
  List<GaleriaModel> get listNE => fotosNE;

  void setFoto(int index, String image) {
    fotosNE.elementAt(index).imagem = image;
    notifyListeners();
  }

  void setData(int index, String data) {
    fotosNE.elementAt(index).data = data;
    notifyListeners();
  }

  void setDescricao(int index, String descricao) {
    fotosNE.elementAt(index).descricao = descricao;
    notifyListeners();
  }

  void addToEncontrados(int index) {
    fotos.add(fotosNE.elementAt(index));
    fotosNE.removeAt(index);
    notifyListeners();
  }
}

class GaleriaModel {
  GaleriaModel({
    this.imagem,
    required this.dinossauro,
    this.descricao,
    this.data,
  });

  final String dinossauro;
  String? imagem;
  String? descricao;
  String? data;

}
