// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_info.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, required this.model}) : super(key: key);

  final InfoModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // model.visivel
        //     ? Column(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(left: 4),
        //             child: Text(
        //               model.data,
        //             ),
        //           ),
        //           SizedBox(height: 5),
        //         ],
        //       )
        //     : SizedBox(height: 10),
        // //TODO ver o tamanho para separar quando nao tem data
        // Container(
        //   height: 160,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(10),
        //       topRight: Radius.circular(10),
        //     ),
        //     image: DecorationImage(
        //       image: AssetImage(model.imagem),
        //       fit: BoxFit.fitWidth,
        //     ),
        //   ),
        // ),
        // // Container(height: 2), // TODO: DPS VER ISTO
        // Row(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         decoration: BoxDecoration(
        //             color: model.cor,
        //             borderRadius: BorderRadius.only(
        //               bottomLeft: Radius.circular(10),
        //               bottomRight: Radius.circular(10),
        //             )),
        //         child: Padding(
        //           padding: const EdgeInsets.only(
        //             right: 7.0,
        //             left: 7.0,
        //             top: 5.0,
        //             bottom: 5.0,
        //           ),
        //           child: Text(
        //             model.titulo,
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
