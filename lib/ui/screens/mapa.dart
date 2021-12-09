// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param, unnecessary_this

import 'dart:async';

import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/ui/screens/dino_selecionado.dart';
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

  final double _markerSize = 24;

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
      backgroundColor: Color(0xFF81A8E7),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 220),
            child: Text(
              "Dino Mapa",
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
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
              child: SearchBarN(
                onChanged: search,
                text: query,
                titulo: "Procura por tema ou data",
              ),
            ),
            //SearchWidget(text: query, onChanged: search, hintText: 'Filtra por dinossauro ou por data'),
            Expanded(child: Center(child: IconButton(icon: Icon(
      Icons.favorite), onPressed: () { 
        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DinoSelecionado(index: 1),
                    ),
                  );
       },))),
          ],
        ),
      ),
      key: _key,
      // Center(
      //   child: SizedBox(
      //     height: 525,
      //     child: SfMaps(
      //       layers: [
      //         MapShapeLayer(
      //           loadingBuilder: (BuildContext context) {
      //             return SizedBox(
      //               height: 25,
      //               width: 25,
      //               child: const CircularProgressIndicator(
      //                 strokeWidth: 3,
      //               ),
      //             );
      //           },
      //           source: _mapSource,
      //           tooltipSettings: MapTooltipSettings(
      //             color: Colors.red,
      //           ),
      //           initialMarkersCount: dinos.length,
      //           markerTooltipBuilder: (BuildContext context, int index) {
      //             return Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Text(dinos2.elementAt(index) != null ? dinos2[index].nome : "",
      //                     style: TextStyle(color: Colors.white, fontSize: 15)));
      //           },
      //           markerBuilder: (BuildContext context, int index) {
      //             return MapMarker(
      //                 latitude: dinos2[index].lat,
      //                 longitude: dinos2[index].long,
      //                 size: Size(_markerSize, _markerSize * 2),
      //                 child: GestureDetector(
      //                   onDoubleTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => DinoSelecionado(
      //                                   index: index,
      //                                 )));
      //                   },
      //                   child: Icon(
      //                     Icons.location_on,
      //                     color: Colors.red,
      //                   ),
      //                 ));
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ));
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

// TODO: https://pub.dev/packages/syncfusion_flutter_maps#get-the-demo-application
// https://github.com/syncfusion/flutter-examples/blob/master/lib/samples/maps/shape_layer/zooming/zooming.dart
