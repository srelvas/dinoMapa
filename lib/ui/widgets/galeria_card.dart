// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, file_names
// import 'package:dino_mapa/ui/screens/galeria.dart';
// import 'package:flutter/material.dart';
// import 'package:dino_mapa/models/model_galeria.dart';

// class GaleriaCard extends StatefulWidget {
//   const GaleriaCard({Key? key, required this.model}) : super(key: key);

//   final GaleriaModel model;

//   @override
//   State<GaleriaCard> createState() => _GaleriaCardState();
// }

// class _GaleriaCardState extends State<GaleriaCard> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 130,
//         decoration: BoxDecoration(color: Color(0xFFE9EAF1), borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(14.0),
//                   child: Container(
//                     child: widget.model.imagem == null
//                         ? Container(
//                             height: 94,
//                             width: 94,
//                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange[200]),
//                             child: IconButton(
//                                 onPressed: () {
                                  
//                                 },
//                                 icon: Icon(Icons.camera_alt_rounded, color: Colors.white60)))
//                         : null,
//                     height: 94,
//                     width: 94,
//                     decoration: widget.model.imagem != null
//                         ? BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: AssetImage(widget.model.imagem!),
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                         : BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [],
//             ),
//           ],
//         ));
//   }
// }
