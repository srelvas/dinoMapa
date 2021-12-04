// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:flutter/cupertino.dart';
import 'package:dino_mapa/ui/widgets/noticias.dart';
import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  const Noticias({Key? key}) : super(key: key);

  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  List<NoticiaModel> lista = [
    NoticiaModel(
      data: '27 de Outubro 2021',
      imagem: 'dsadsadsa',
      subtitulo: 'sadasdasd',
      texto: 'adsfsdaf',
      titulo: 'asddas',
      visivel: true,
      cor: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 150),
            child: Text(
              "Dino Noticias",
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    lista[index].visivel ? _buildSeparator(lista[index]) : const SizedBox(),
                itemCount: lista.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) =>
                    NoticiaWidget(
                      model: lista[index],
                    )),
          ),
        ],
      ),
    );
    // para cada elemento da lista view fazer container com imagem, titulo e separador para o proximo
    // para cada elemnto da lista cria um NoticiaWidget(model)
    // list view
  }
}
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: const Text('Empty List Test')),
//     body: itemCount > 0
//       ? ListView.builder(
//           itemCount: itemCount,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               title: Text('Item ${index + 1}'),
//             );
//           },
//         )
//       : const Center(child: Text('No items')),
//   );
// }

// Expanded(
//             child: ListView.separated(
//               separatorBuilder: (BuildContext context, int index) =>
//                   index == 0 || notifications[index].date!.day != day ? _buildSeparator(notifications[index]) : const SizedBox(),
//               itemCount: notifications.length,
//               itemBuilder: (
//                 BuildContext context,
//                 int index,
//               ) =>
//                   NotificationTile(model: notifications[index]),
//             ),
//           ),

Widget _buildSeparator(NoticiaModel notification) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("asdadssadasdadsdsdsdsds"),
        if (notification.visivel)
          Container(
            width: 6.0,
            height: 6.0,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
      ],
    ),
  );
}
