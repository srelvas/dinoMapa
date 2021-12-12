// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_this
import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/ui/widgets/favoritos_widget.dart';
import 'package:dino_mapa/ui/widgets/search_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          padding: const EdgeInsets.only(top: 15, right: 20),
          child: SearchBarN(
            onChanged: search,
            text: query,
            titulo: "Procura por fóssil",
            w: 170,
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
