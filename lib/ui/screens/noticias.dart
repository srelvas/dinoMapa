// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:dino_mapa/ui/screens/noticias2.dart';
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
      imagem: "assets/images/not4.jpg",
      subtitulo: 'sadasdasd',
      texto: 'adsfsdaf',
      titulo: 'Novo dinossauro Sauropode tem nome que alude ao Atlântico e à música de Björk',
      visivel: true,
      cor: Colors.orange,
    ),
    NoticiaModel(
      data: '29 de Outubro 2021',
      imagem: "assets/images/not3.jpg",
      subtitulo: 'sadasdasd',
      texto: 'ghjghjgs',
      titulo: 'Paleontólogos escavam quarto ninho de dinossauro Dinheirossaurus Lorinhanensis',
      visivel: true,
      cor: Colors.blue,
    ),
    NoticiaModel(
      data: '29 de Outubro 2021',
      imagem: "assets/images/not3.jpg",
      subtitulo: 'sadasdasd',
      texto: 'adsfsdaf',
      titulo: '3',
      visivel: false,
      cor: Colors.blue,
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
              "Dino Noticias",
              style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
      backgroundColor: Color(0xFFF3AD78).withOpacity(0.9),
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
                    GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NoticiasExpanded(model: lista[index])),
                    );
                  },
                  child: NoticiaWidget(
                    model: lista[index],
                  ),
                ),
              ),
            ),
          ],
        ),
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

// Widget _buildSeparator(NoticiaModel noticia) {
//   return Padding(
//     padding: EdgeInsets.only(bottom: 10.0),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.red,
//                     shape: BoxShape.rectangle,
//                   ),
//                   child: noticia.visivel
//                       ? Text(
//                           noticia.data,
//                           textAlign: TextAlign.left,
//                         )
//                       : SizedBox()),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
