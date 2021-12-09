// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param

import 'package:dino_mapa/models/dinoStore.dart';
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
                        color: dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Colors.white,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                          fit: BoxFit.fill,
                          image: AssetImage(dinoStore.todos[widget.index].imagemPrincipal),
                        )),
                        height: 200,
                      ),
                      Positioned(
                        top: 170.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                            color: dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height - 100,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:8, right: 10),
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
                                    Column(
                                      children: [
                                        SizedBox(height:12),
                                        Text(dinoStore.todos[widget.index].nome,
                                            style: TextStyle(fontSize: 20, color: !dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Colors.blue[900])),
                                        Text(dinoStore.todos[widget.index].sitioDescoberta,
                                            style: TextStyle(fontSize: 12, color: !dinoStore.todos[widget.index].isfavorito ? Colors.grey[600] : Colors.white)),
                                      ],
                                    ),
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(
                                        !dinoStore.todos[widget.index].isfavorito ? Icons.star_outline_rounded : Icons.star_rounded ,
                                        color: !dinoStore.todos[widget.index].isfavorito ? Colors.black :  Colors.yellow[700],
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
                                labelColor: !dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Colors.white ,
                                labelStyle: TextStyle(
                                  fontFamily: 'Hammersmith',
                                ),
                                indicatorColor: !dinoStore.todos[widget.index].isfavorito ? Theme.of(context).primaryColor : Colors.white ,
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
                                        Text(dinoStore.todos[widget.index].tituloImagem1),
                                        SizedBox(height: 3),
                                        Container(
                                          height: 180,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: kElevationToShadow[4],
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(dinoStore.todos[widget.index].imagem1),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(dinoStore.todos[widget.index].tituloImagem2),
                                        SizedBox(height: 4),
                                        Container(
                                          height: 180,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: kElevationToShadow[4],
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(dinoStore.todos[widget.index].imagem2),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ]),
                                    ),
                                    Text("22222222222222222222222222"),
                                    Text("333333333333333333333333333")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
