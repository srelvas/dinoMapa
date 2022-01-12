// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param, unnecessary_this

import 'dart:async';

import 'package:dino_mapa/models/chip.dart';
import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/ui/screens/WrappedMultipleChipClasse.dart';
import 'package:dino_mapa/ui/screens/WrappedMultipleChipFilo.dart';

import 'package:dino_mapa/ui/screens/WrappedMultipleChipIntervalo.dart';
import 'package:dino_mapa/ui/screens/dino_selecionado.dart';
import 'package:dino_mapa/ui/screens/hero_dialog_route.dart';
import 'package:dino_mapa/ui/widgets/search_noticias.dart';
import 'package:flutter/foundation.dart';

// ignore: unused_import
import 'package:flutter/gestures.dart';

///Flutter package imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Core theme import
import 'package:syncfusion_flutter_core/theme.dart';

///Map import
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_maps/maps.dart';

import 'package:dino_mapa/ui/widgets/menu.dart';
import 'package:flutter/material.dart';

class Mapa extends StatefulWidget {
  final String email;
  Mapa(@required this.email, {Key? key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  late MapShapeSource _mapSource;

  final double _markerSize = 30;

  late List<DinoModel> dinos;
  late List<DinoModel> dinos2;
  String query = "";

  Timer? _tooltipTimer;

  @override
  void initState() {
    dinos = Provider.of<DinoStore>(context, listen: false).todos;
    dinos2 = [...dinos];
    _mapSource = MapShapeSource.asset(
      'assets/jsons/cd.json',
      shapeDataField: 'Distrito',
      dataCount: dinos2.length,
      primaryValueMapper: (int index) => dinos2[index].nome,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dinos = Provider.of<DinoStore>(context, listen: false).todos;
    dinos2 = [...dinos];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tooltipTimer?.cancel();
    _tooltipTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: Color(0xFF81A8E7),
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 100),
              child: Text(
                "Dino Mapa",
                style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
                child: Hero(
                  tag: 'faq',
                  child: Icon(Icons.help, size: 32, color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                    return FAQ();
                  }));
                }),
            SizedBox(width: 10),
          ],
          leading: IconButton(
            icon: Icon(IconData(58332, fontFamily: 'MaterialIcons')),
            onPressed: () => _key.currentState!.openDrawer(),
          ),
        ),
        drawer: Menu(widget.email),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5),
                child: Row(
                  children: [
                    SearchBarN(
                      onChanged: search,
                      text: query,
                      titulo: "Procura por fossil",
                      w: 165,
                    ),
                    SizedBox(width: 20),
                    SingleChildScrollView(
                      child: GestureDetector(
                          child: Hero(
                            tag: 'filtros',
                            child: Container(
                              height: 30,
                              width: 96,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9),
                                    child: Icon(Icons.filter_list_alt, color: Colors.blue),
                                  ),
                                  SizedBox(width: 10),
                                  Text("Filtros", style: TextStyle(fontSize: 13)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: kElevationToShadow[4],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                              return Filtros();
                            }));
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 510,
                    child: SfMaps(
                      layers: [
                        MapShapeLayer(
                          loadingBuilder: (BuildContext context) {
                            return SizedBox(
                              height: 25,
                              width: 25,
                              child: const CircularProgressIndicator(
                                strokeWidth: 3,
                              ),
                            );
                          },
                          source: _mapSource,
                          tooltipSettings: MapTooltipSettings(
                            color: Colors.orange[400],
                          ),
                          initialMarkersCount: dinos.length,
                          markerTooltipBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(dinos2[index].nome, style: TextStyle(color: Colors.white, fontSize: 15)));
                          },
                          markerBuilder: (BuildContext context, int index) {
                            return MapMarker(
                                latitude: dinos2[index].lat,
                                longitude: dinos2[index].long,
                                size: Size(30, 30),
                                child: GestureDetector(
                                  onDoubleTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DinoSelecionado(
                                          index: index,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.location_on,
                                    color: dinos2[index].isDino ? Colors.red : Colors.blue,
                                  ),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 37),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text("Dinossauros"),
                  SizedBox(width: 50),
                  Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 25,
                  ),
                  SizedBox(width: 2),
                  Text("Outros fosseis"),
                ],
              ),
              SizedBox(height: 9),
            ],
          ),
        ),
      ),
    );
  }

  void search(String query) {
    final l = dinos.where((nModel) {
      final titulo = nModel.nome.toLowerCase();
      final loc = nModel.sitioDescoberta.toLowerCase();
      final searchQ = query.toLowerCase();

      return titulo.contains(searchQ) || loc.contains(searchQ);
    }).toList();

    setState(() {
      this.query = query;
      this.dinos2 = l;
    });
  }
}

class Filtros extends StatefulWidget {
  const Filtros({Key? key}) : super(key: key);

  @override
  State<Filtros> createState() => _FiltrosState();
}

class _FiltrosState extends State<Filtros> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Hero(
          tag: 'filtros',
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 615,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("Filtros", style: TextStyle(fontSize: 18, color: Colors.blue)),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.close, color: Colors.black, size: 22))
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 29, top: 12),
                    child: Text("Classe", style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: WrappedMultipleChipClasse(),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 29,
                    ),
                    child: Text("Filo", style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: WrappedMultipleChipFilo(),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 29,
                    ),
                    child: Text("Intervalo de tempo", style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: WrappedMultipleChipIntervalo(),
                  ),
                  SizedBox(height: 2),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                        width: 280,
                        height: 35,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Text("Aplicar filtros", style: TextStyle(fontSize: 14, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        "Remover todos os filtros",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Hero(
          tag: 'faq',
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 530,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Perguntas mais frequentes",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        )),
                    SizedBox(height: 15),
                    Text(
                      '1. Como aceder à página de informação de um dinossauro/fóssil?',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Quando quer ver um dinossauro/fóssil no mapa deve carregar duas vezes no icon de localização do fossil pretendido, onde o primeiro clique mostra o nome do fóssil (para ter a certeza que é o fossíl que pretende visualizar), e o segundo clique leva-o para a pagina do dinossauro em questão.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '2. Como ver os dinossauros/fósseis apenas de certos períodos geológicos e/ou dentro de certas categorias taxonômicas?',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'No canto superior esquerdo existe um botão de filtragem. Ao carregar abrirá um pop-up onde pode selecionar os tempos geológicos dentro dos quais deseja encontrar fósseis, assim como as categorias taxonômicas que deseja ver.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '3. Gostaria de pesquisar por um dinossauro/fóssil apartir do seu nome, como faço?',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'No canto superior esquerdo existe uma barra de pesquisa onde pode procurar pelo nome do fóssil.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
