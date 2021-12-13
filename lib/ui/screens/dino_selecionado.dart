// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param, unused_local_variable

import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/ui/screens/galeria.dart';
import 'package:dino_mapa/ui/screens/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DinoSelecionado extends StatefulWidget {
  final int index;
  const DinoSelecionado({Key? key, required this.index}) : super(key: key);

  @override
  _DinoSelecionadoState createState() => _DinoSelecionadoState();
}

class _DinoSelecionadoState extends State<DinoSelecionado> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = tabController!.index;

    return Consumer<DinoStore>(
        builder: (context, dinoStore, child) => Scaffold(
              body: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Color(0xFFF2F3F8),
                      ),
                      Hero(
                        tag: dinoStore.todos[widget.index].index,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                            fit: BoxFit.fill,
                            image: AssetImage(dinoStore.todos[widget.index].imagemPrincipal),
                          )),
                          height: 200,
                        ),
                      ),
                      Positioned(
                          top: 170.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0),
                              ),
                              color: dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Color(0xFFF2F3F8),
                            ),
                            height: MediaQuery.of(context).size.height - 100,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.only(left: 33),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 12),
                                            Text(dinoStore.todos[widget.index].nome,
                                                style: TextStyle(
                                                    fontSize: dinoStore.todos[widget.index].nameBig == true ? 14 : 20,
                                                    color: !dinoStore.todos[widget.index].isfavorito
                                                        ? Theme.of(context).primaryColor
                                                        : Colors.blue[900])),
                                            Text(dinoStore.todos[widget.index].sitioDescoberta,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: !dinoStore.todos[widget.index].isfavorito ? Colors.grey[600] : Colors.white)),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        padding: EdgeInsets.only(top: 12, left: 5),
                                        icon: Icon(
                                          Icons.camera_alt_outlined,
                                          color: !dinoStore.todos[widget.index].isfavorito ? Colors.black54 : Colors.blue[900],
                                          size: 33,
                                        ),
                                        onPressed: () {
                                          //
                                          Route route = MaterialPageRoute(builder: (context) => Galeria(leading: 'sim'));
                                          Navigator.pushReplacement(context, route);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          !dinoStore.todos[widget.index].isfavorito ? Icons.star_outline_rounded : Icons.star_rounded,
                                          color: !dinoStore.todos[widget.index].isfavorito ? Colors.black54 : Colors.yellow[700],
                                          size: 40,
                                        ),
                                        onPressed: () {
                                          dinoStore.setFav(widget.index);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                TabBar(
                                  indicator: null,
                                  controller: tabController,
                                  padding: EdgeInsets.only(bottom: 5),
                                  unselectedLabelColor: Colors.blue[900],
                                  tabs: <Widget>[
                                    Tab(
                                      child: Text("Info", style: TextStyle(fontSize: 14)),
                                    ),
                                    Tab(
                                      child: Text("Taxonomia", style: TextStyle(fontSize: 14)),
                                    ),
                                    Tab(
                                      child: Text("Evolução", style: TextStyle(fontSize: 14)),
                                    ),
                                  ],
                                  labelColor: !dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Colors.white,
                                  labelStyle: TextStyle(
                                    fontFamily: 'Hammersmith',
                                  ),
                                  indicatorColor: !dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Colors.white,
                                ),
                                Container(
                                  color: dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Color(0xFFF2F3F8),
                                  height: 500,
                                  child: TabBarView(
                                    controller: tabController,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30, right: 30),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          SizedBox(height: 10),
                                          Text(dinoStore.todos[widget.index].tituloImagem1,
                                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                          SizedBox(height: 6),
                                          Container(
                                            child: (dinoStore.todos[widget.index].imagem1 != '')
                                                ? Container(
                                                    height: 170,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      boxShadow: kElevationToShadow[4],
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(dinoStore.todos[widget.index].imagem1),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                          SizedBox(height: 20),
                                          Text(dinoStore.todos[widget.index].tituloImagem2,
                                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                                          SizedBox(height: 6),
                                          Container(
                                            child: (dinoStore.todos[widget.index].imagem2 != '')
                                                ? Container(
                                                    height: 170,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      boxShadow: kElevationToShadow[4],
                                                      image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(dinoStore.todos[widget.index].imagem2),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                          SizedBox(height: 10),
                                        ]),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 115),
                                              Text(
                                                "Filo: ",
                                                style: TextStyle(
                                                  color: dinoStore.todos[widget.index].isfavorito ? Colors.white : Colors.blue[900],
                                                ),
                                              ),
                                              SizedBox(width: 80),
                                              Text(
                                                dinoStore.todos[widget.index].filo,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 94),
                                              Text(
                                                "Classe: ",
                                                style: TextStyle(
                                                    color: dinoStore.todos[widget.index].isfavorito ? Colors.white : Colors.blue[900]),
                                              ),
                                              SizedBox(width: 80),
                                              Text(dinoStore.todos[widget.index].classe),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 94),
                                              Text(
                                                "Ordem: ",
                                                style: TextStyle(
                                                    color: dinoStore.todos[widget.index].isfavorito ? Colors.white : Colors.blue[900]),
                                              ),
                                              SizedBox(width: 80),
                                              Text(dinoStore.todos[widget.index].ordem ?? "Não identificada"),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Center(
                                            child: Hero(
                                              tag: widget.index,
                                              child: GestureDetector(
                                                child: Container(
                                                  height: 300,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage("assets/images/taxonomy.png"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 94),
                                              Text(
                                                "Intervalo: ",
                                                style: TextStyle(
                                                    color: dinoStore.todos[widget.index].isfavorito ? Colors.white : Colors.blue[900]),
                                              ),
                                              SizedBox(width: 80),
                                              Text(dinoStore.todos[widget.index].intervalo),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: 117),
                                              Text(
                                                "Dieta: ",
                                                style: TextStyle(
                                                  color: dinoStore.todos[widget.index].isfavorito ? Colors.white : Colors.blue[900],
                                                ),
                                              ),
                                              SizedBox(width: 80),
                                              Text(
                                                dinoStore.todos[widget.index].filo,
                                              )
                                            ],
                                          ),
                                          SizedBox(height:24),
                                          Center(
                                            child: Container( 
                                              height: 350,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                boxShadow: kElevationToShadow[4],
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                image: DecorationImage(
                                                  image: AssetImage(dinoStore.todos[widget.index].taxonomyEvolutionImage),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ));
  }
}
