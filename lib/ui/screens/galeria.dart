// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:dino_mapa/models/galeriaStore.dart';
import 'package:dino_mapa/ui/widgets/galeria_Card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Galeria extends StatefulWidget {
  const Galeria({Key? key}) : super(key: key);

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GaleriaStore>(
        builder: (context, galeriaStore, child) => Scaffold(
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 220),
                    child: Text(
                      "Dino Galeria",
                      style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
                    ),
                  ),
                  SizedBox(width: 22),
                ],
              ),
              backgroundColor: Color(0xFFF2F3F8),
              body: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(galeriaStore.fotos.length.toString() + " / 323", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 40),
                    ],
                  ),
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
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10.0),
                      itemCount: galeriaStore.fotos.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) =>
                          Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(color: Color(0xFFE9EAF1), borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14, right: 20, top: 14, bottom: 4),
                                    child: Container(
                                        height: 94,
                                        width: 94,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(galeriaStore.fotos[index].imagem!),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                  galeriaStore.fotos[index].data != null ? Text(galeriaStore.fotos[index].data!, style: TextStyle(fontSize: 12)) : SizedBox(height: 0, width: 0),
                                ],
                              ),
                              Column(
                                children: [
                                 
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10.0),
                      itemCount: galeriaStore.fotosNE.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) =>
                          Padding(
                              padding: EdgeInsets.only(left: 40, right: 40),
                              child: Container(
                                  height: 130,
                                  decoration: BoxDecoration(color: Color(0xFFE9EAF1), borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Container(
                                              child: Container(
                                                  height: 94,
                                                  width: 94,
                                                  decoration:
                                                      BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange[200]),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        galeriaStore.setFoto(index, "assets/images/lucky1.jpg");
                                                        galeriaStore.setData(index, DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()); // TODO: MUDAR ISTO
                                                        galeriaStore.addToEncontrados(index);
                                                      },
                                                      icon: Icon(Icons.camera_alt_rounded, color: Colors.white60))),
                                              height: 94,
                                              width: 94,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                      Column(
                                        children: [],
                                      ),
                                    ],
                                  ))),
                    ),
                  ),
                ],
              ),
            ));
  }
}
