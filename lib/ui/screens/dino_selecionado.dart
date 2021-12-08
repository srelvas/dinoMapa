// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/models/model_info.dart';
import 'package:dino_mapa/ui/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DinoSelecionado extends StatefulWidget {
  final int index;
  const DinoSelecionado({Key? key, required this.index}) : super(key: key);

  @override
  _DinoSelecionadoState createState() => _DinoSelecionadoState();
}

class _DinoSelecionadoState extends State<DinoSelecionado> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DinoStore>(
      builder: (context, dinoStore, child) => Scaffold(
        backgroundColor: Color(0xFFF2F3F8),
        body: DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: Stack(
            children: <Widget>[
              Scaffold(
                body: Center(child: Text((dinoStore.todos[widget.index].nome))),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 15.0,
                      )
                    ],
                  ),
                  child: TabBar(
                    unselectedLabelColor: Colors.redAccent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    tabs: <Widget>[
                      Tab(
                        height: 62,
                        text: "Info",
                      ),
                      Tab(
                        height: 62,
                        text: "Taxonomia",
                      ),
                      Tab(
                        height: 62,
                        text: "Vida e evolução",
                      ),
                    ],
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Hammersmith',
                    ),
                    indicatorColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
