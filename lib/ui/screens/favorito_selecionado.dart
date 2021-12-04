import 'package:dino_mapa/models/model_favoritos.dart';
import 'package:flutter/material.dart';

class FavoritoSelecionado extends StatefulWidget {
  final FavoritosModel fav;
  const FavoritoSelecionado({Key? key, required this.fav}) : super(key: key);

  @override
  _FavoritoSelecionadoState createState() => _FavoritoSelecionadoState();
}

class _FavoritoSelecionadoState extends State<FavoritoSelecionado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
        title:
                  Image.asset(
                  widget.fav.imagem,
                  fit: BoxFit.fitWidth,
                  //height: 100,

          )
      ), */
        backgroundColor: Color(0xFFF2F3F8),
        body: Stack(
          children: [
            Image(
              image: AssetImage(widget.fav.imagem),
              fit: BoxFit.cover,
              height: 500,
              width: 500,
              alignment: Alignment.center,
            ),
            /*  Container(
            /* Image.asset(
              widget.fav.imagem,
              fit: BoxFit.fitWidth,
            ) */
            /* decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.fav.imagem),
                fit: BoxFit.fitWidth,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ), */
          ) */
            Center(
                child: Column(children: [
              Container(
                  //color: Color(0x00c5cdd5),
                  height: 500,
                  alignment: Alignment.center,
                  child: Text(widget.fav.nome,
                      style: TextStyle(color: Colors.red, fontSize: 30)))
            ]))
          ],
        ));
  }
}
