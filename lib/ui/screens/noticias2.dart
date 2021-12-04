// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, type_init_formals
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:dino_mapa/ui/widgets/noticias.dart';
import 'package:flutter/material.dart';

class NoticiasExpanded extends StatefulWidget {
  const NoticiasExpanded({Key? key, required NoticiaModel this.model}) : super(key: key);

  final NoticiaModel model;

  @override
  _NoticiasExpandedState createState() => _NoticiasExpandedState();
}

class _NoticiasExpandedState extends State<NoticiasExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 150),
            child: Text(
              "Dino Noticias", //TODO este text vai ser a data
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ], //TODO meter leading aqui com botao pa voltar para tras
      ),
      backgroundColor: Color(0xFFF3AD78).withOpacity(0.9),
    );
    // para cada elemento da lista view fazer container com imagem, titulo e separador para o proximo
    // para cada elemnto da lista cria um NoticiaWidget(model)
    // list view
  }
}
