// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_this
import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/ui/screens/WrappedMultipleChipFilo.dart';
import 'package:dino_mapa/ui/screens/hero_dialog_route.dart';
import 'package:dino_mapa/ui/widgets/favoritos_widget.dart';
import 'package:dino_mapa/ui/widgets/search_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'WrappedMultipleChipClasse.dart';
import 'dino_selecionado.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  late List<DinoModel> favs;
  late List<DinoModel> favs2;
  late List<DinoModel> todos;

  String query = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    todos = Provider.of<DinoStore>(context).todos;
    favs = Provider.of<DinoStore>(context).favoritos;
    favs2 = [...favs];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 150),
            child: Text(
              "Dino Favoritos",
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 15, bottom: 5),
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
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            itemCount: favs2.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {
                    query = "";
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DinoSelecionado(index: todos.indexOf(favs2[index])),
                    ),
                  );
                },
                child: FavoritosWidget(model: favs2[index])),
            separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 40,
            ),
          ),
        )
      ]),
    );
  }

  void search(String query) {
    final l = favs.where((nModel) {
      final nome = nModel.nome.toLowerCase();
      final searchQ = query.toLowerCase();

      return nome.contains(searchQ);
    }).toList();

    setState(() {
      this.query = query;
      this.favs2 = l;
    });
  }
}

class Filtros extends StatefulWidget {
  const Filtros({Key? key}) : super(key: key);

  @override
  State<Filtros> createState() => _FiltrosState();
}

class _FiltrosState extends State<Filtros> {
  double _value = 0.0;

  List<String> intervalos = [
    'Não especificado',
    'Silurian',
    'Tithonian',
    'Kimmeridgian',
    'Valanginian',
  ];

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
                    padding: EdgeInsets.only(left: 29, top: 30),
                    child: Text("Classe", style: TextStyle(fontSize: 16)),
                  ),
                  Center(child: WrappedMultipleChipClasse()),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 29,
                    ),
                    child: Text("Filo", style: TextStyle(fontSize: 16)),
                  ),
                  Center(child: WrappedMultipleChipFilo()),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(left: 29, top: 10),
                    child: Text("Intervalo de tempo", style: TextStyle(fontSize: 16)),
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: Slider(
                        min: 0.0,
                        max: 4.0,
                        value: _value,
                        divisions: 4,
                        activeColor: Colors.orange,
                        inactiveColor: Colors.orange[200],
                        thumbColor: Colors.blue[400],
                        label: intervalos[_value.round()],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
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
