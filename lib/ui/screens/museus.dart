// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_museu.dart';
import 'package:dino_mapa/ui/widgets/museu.dart';
import 'package:flutter/material.dart';

class Museus extends StatefulWidget {
  const Museus({Key? key}) : super(key: key);

  @override
  _MuseusState createState() => _MuseusState();
}

class _MuseusState extends State<Museus> {
  List<MuseuModel> lista = [
    MuseuModel(
      numero: '+351 939315850',
      expanded: false,
      categorias: '''< 2 anos:
3 aos 5 anos:
6 aos 11 anos:
12 anos:''',
      precos: '''Gratuito
Gratuito
2,00€ 
4,00€''',
      morada: 'R. João Luís de Moura 95, 2530-158 Lourinhã',
      interior: 'assets/images/lourinha_interior.jpg',
      interiorColor: 0xFFecae77,
      exterior: 'assets/images/lourinha_exterior.jpg',
      horarioCompacto: '10-13h/14:30-18h',
      horario: '''De terça a domingo
10h-13h/14h30-18h''',
      exteriorColor: 0xFF5badd4,
      name: 'Museu da Lourinhã',
      weekdays: [
        2,
        3,
        4,
        5,
        6,
        7,
      ],
      horarioEntradaManha: '10:00',
      horarioSaidaManha: '13:00',
      horarioEntradaTarde: '14:30',
      horarioSaidaTarde: '18:00',
    ),
    MuseuModel(
      numero: '+351 213921897',
      expanded: false,
      categorias: '''Adultos:
Bonificados:
Famílias:''',
      precos: '''5,00€
3,00€
12,50€''',
      morada: 'R. da Escola Politécnica 56, 1250-102 Lisboa',
      interior: 'assets/images/lourinha_interior.jpg',
      interiorColor: 0xFFecae77,
      exterior: 'assets/images/lourinha_exterior.jpg',
      horarioCompacto: '10h-17h',
      horario: '''De terça a domingo
10h00 às 17h00''',
      exteriorColor: 0xFF5badd4,
      name: 'Museu de História Natural e Ciência',
      weekdays: [
        2,
        3,
        4,
        5,
        6,
        7,
      ],
      horarioEntradaManha: '10:00',
      horarioSaidaManha: '17:00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 150),
            child: Text(
              "Dino Museus",
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 60),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 20,
                ),
                itemCount: lista.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) =>
                    //   GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           MuseuExpanded(model: lista[index]),
                    //     ),
                    //   );
                    // },
                    /*child: */ MuseuWidget(
                  model: lista[index],
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
    // para cada elemento da lista view fazer container com imagem, titulo e separador para o proximo
    // para cada elemnto da lista cria um MuseuWidget(model)
    // list view
  }
}
