// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, type_init_formals
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:flutter/material.dart';

class NoticiasExpanded extends StatefulWidget {
  const NoticiasExpanded({Key? key, required NoticiaModel this.model, required int this.index}) : super(key: key);

  final NoticiaModel model;
  final int index;

  @override
  _NoticiasExpandedState createState() => _NoticiasExpandedState();
}

class _NoticiasExpandedState extends State<NoticiasExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F3F8),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(widget.model.imagem, fit: BoxFit.cover),
          ),
          expandedHeight: 200,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 150, bottom: 10),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
                height: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.model.data.trim(),
                    style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(width: 22),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(widget.model.fonte, style: TextStyle(color: Colors.grey[700], fontSize: 10)),
                    ],
                  ),
                  Text(
                    widget.model.titulo,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(height: 9),
                  Text(
                    widget.model.subtitulo,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF404040), fontSize: 13.5),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.model.texto,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(height: 15),
                  /*Column(
                  children: [
                    Expanded(
                      child: Text(widget.model.texto),
                    )
                  ],
                )*/
                ],
              ),
            ),
          ),
        ),
      ]),
    );
    // para cada elemento da lista view fazer container com imagem, titulo e separador para o proximo
    // para cada elemnto da lista cria um NoticiaWidget(model)
    // list view
  }
}
