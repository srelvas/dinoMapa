// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:dino_mapa/models/model_galeria.dart';
import 'package:flutter/material.dart';

class Galeria extends StatefulWidget {
  const Galeria({Key? key}) : super(key: key);

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  List<GaleriaModel> encontrados = [
    const GaleriaModel(
        data: "31/10/2021",
        dinossauro: 'Dinheirosaurus lourinhanensis',
        descricao: 'Tirei esta foto no museu da Lourinhã. Foi descoberto em Portugal pelo paleontólogo Octávio Mateus!!'),
    // imagem: "assets/..." dps meter Image.assets(GaleriaModel[0].image),
  ];

  List<GaleriaModel> naoEncontrados = [
    const GaleriaModel(
      dinossauro: 'Apatosaurus alenquerense',
    ),
    const GaleriaModel(
      dinossauro: 'Sauropoda',
    ),
    const GaleriaModel(
      dinossauro: 'Branchiopoda',
    ),
    const GaleriaModel(
      dinossauro: 'Diagoniella',
    ),
    const GaleriaModel(
      dinossauro: 'Mitromorpha azorensis',
    ),
    // imagem: "assets/..." dps meter Image.assets(GaleriaModel[0].image),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 15, left: 220),
                child: Text(
                  "Dino Galeria",
                  style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
                ), // talvez bold? idk
              ),
            ),
            // TODO: SEARCH BAR
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(encontrados.length.toString() + " / 323"),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Encontrados",
                    style: TextStyle(
                      color: Color(0xFF47525E),
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 40.0),
                      child: Divider(
                        color: Color(0xFFC1CDDA),
                        thickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //ListView.builder(itemBuilder: itemBuilder) encontrados
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Não Encontrados",
                    style: TextStyle(
                      color: Color(0xFF47525E),
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 40.0),
                      child: Divider(
                        color: Color(0xFFC1CDDA),
                        thickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //ListView.builder(itemBuilder: itemBuilder) nao encontrados
          ],
        ),
      ),
    );
  }
}
