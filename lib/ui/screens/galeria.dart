// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors_in_immutables, invalid_required_positional_param, sized_box_for_whitespace

import 'dart:io';

import 'package:dino_mapa/models/galeriaStore.dart';
import 'package:dino_mapa/ui/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Galeria extends StatefulWidget {
  const Galeria({Key? key}) : super(key: key);

  @override
  _GaleriaState createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  File? image;
  String iPath = "";

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GaleriaStore>(
        builder: (context, galeriaStore, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 100),
                    child: Text(
                      "Dino Galeria",
                      style: TextStyle(letterSpacing: 1.0, color: Colors.white, fontSize: 23),
                    ),
                  ),
                  SizedBox(width: 22),
                ],
              ),
              backgroundColor: Color(0xFFF2F3F8),
              body: Column(
                children: [
                  SizedBox(height: 10.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(galeriaStore.fotos.length.toString() + " / 200", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 40),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SearchBar(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Encontrados",
                          style: TextStyle(
                            color: Color(0xFF47525E),
                          ),
                        ),
                        Expanded(
                          child: new Container(
                            margin: const EdgeInsets.only(left: 15.0, right: 40.0),
                            child: Divider(
                              color: Color(0xFFC1CDDA),
                              thickness: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10.0),
                      itemCount: galeriaStore.fotos.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) =>
                          Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40, right: 40),
                            child: Container(
                              height: 135,
                              decoration: BoxDecoration(
                                  boxShadow: kElevationToShadow[3], color: Color(0xFFE9EAF1), borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14, top: 14, bottom: 5),
                                        child: Hero(
                                          tag: index,
                                          child: GestureDetector(
                                            child: Container(
                                              height: 94,
                                              width: 94,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: FileImage(File(galeriaStore.fotos[index].imagem!)),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => HeroImage(
                                                          index,
                                                          galeriaStore.fotos[index].imagem!,
                                                        ))),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      galeriaStore.fotos[index].data != null
                                          ? Row(
                                              children: [
                                                SizedBox(width: 15),
                                                Text(galeriaStore.fotos[index].data!,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    )),
                                              ],
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10),
                                                  child: SizedBox(
                                                    width: 135,
                                                    child: Text(
                                                      galeriaStore.fotos[index].dinossauro,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(color: Colors.blue[900]),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                                splashRadius: 2,
                                                padding: EdgeInsets.all(0),
                                                iconSize: 15,
                                                onPressed: () async {
                                                  Future pickImage(ImageSource? s) async {
                                                    if (s == null) return;
                                                    final XFile? image = await ImagePicker().pickImage(source: s);

                                                    if (image == null) return;

                                                    File imageFile = File(image.path);
                                                    Directory appDocDir = await getApplicationDocumentsDirectory();
                                                    String appDocPath = appDocDir.path;
                                                    final fileName = basename(imageFile.path);
                                                    final File localImage = await imageFile.copy('$appDocPath/$fileName');

                                                    setState(() {
                                                      this.image = localImage;
                                                      iPath = image.path;
                                                      galeriaStore.setFotoE(index, this.image!.path);
                                                    });
                                                  }

                                                  Future<ImageSource?> sourceI(BuildContext context) async {
                                                    return await showModalBottomSheet(
                                                        context: context,
                                                        builder: (context) => Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                ListTile(
                                                                  leading: Icon(Icons.edit, color: Theme.of(context).primaryColor),
                                                                  title: Text(
                                                                    'Alterar descrição',
                                                                  ),
                                                                  onTap: () {
                                                                    setState(() {
                                                                      galeriaStore.setDescricao(index, null);
                                                                      Navigator.of(context).pop();
                                                                    });
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  title: Text(
                                                                    'Alterar fotografia atual: ',
                                                                  ),
                                                                ),
                                                                ListTile(
                                                                  leading: Icon(Icons.camera_alt, color: Theme.of(context).primaryColor),
                                                                  title: Text(
                                                                    'Câmara',
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.of(context).pop(ImageSource.camera);
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  leading: Icon(Icons.photo_album, color: Theme.of(context).primaryColor),
                                                                  title: Text(
                                                                    'Galeria',
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.of(context).pop(ImageSource.gallery);
                                                                  },
                                                                )
                                                              ],
                                                            ));
                                                  }

                                                  final source = await sourceI(context);
                                                  pickImage(source);
                                                },
                                                icon: Icon(Icons.edit))
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      (galeriaStore.fotos[index].descricao != null)
                                          ? Padding(
                                              padding: const EdgeInsets.only(left: 4, bottom: 8),
                                              child: Container(
                                                width: 180,
                                                child: Text(
                                                  galeriaStore.fotos[index].descricao!,
                                                  textAlign: TextAlign.left,
                                                  maxLines: 4,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 131,
                                                    child: TextField(
                                                        controller: textController,
                                                        style: TextStyle(fontSize: 12),
                                                        autofocus: false,
                                                        maxLines: 2,
                                                        maxLength: 80,
                                                        keyboardType: TextInputType.multiline,
                                                        textInputAction: TextInputAction.done,
                                                        decoration: InputDecoration(
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding: EdgeInsets.all(8),
                                                          hintText: "Adiciona uma descrição",
                                                          hintStyle: TextStyle(fontSize: 12),
                                                        )),
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(height: 8),
                                                      IconButton(
                                                        icon: Icon(Icons.save_alt, color: Colors.black),
                                                        onPressed: () {
                                                          setState(() {
                                                            galeriaStore.setDescricao(index, textController.text);
                                                            textController.clear();
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: index == galeriaStore.fotos.length - 1 ? 10 : 0)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SearchBar(),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Não Encontrados",
                          style: TextStyle(
                            color: Color(0xFF47525E),
                          ),
                        ),
                        Expanded(
                          child: new Container(
                            margin: const EdgeInsets.only(left: 15.0, right: 40.0),
                            child: Divider(
                              color: Color(0xFFC1CDDA),
                              thickness: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10.0),
                      itemCount: galeriaStore.fotosNE.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) =>
                          Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 40, right: 40),
                              child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      boxShadow: kElevationToShadow[3], color: Color(0xFFE9EAF1), borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Container(
                                              child: Container(
                                                  decoration:
                                                      BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange[200]),
                                                  child: IconButton(
                                                      onPressed: () async {
                                                        Future pickImage(ImageSource? s) async {
                                                          if (s == null) return;
                                                          final XFile? image = await ImagePicker().pickImage(source: s);

                                                          if (image == null) return;

                                                          File imageFile = File(image.path);
                                                          Directory appDocDir = await getApplicationDocumentsDirectory();
                                                          String appDocPath = appDocDir.path;
                                                          final fileName = basename(imageFile.path);
                                                          final File localImage = await imageFile.copy('$appDocPath/$fileName');

                                                          setState(() {
                                                            this.image = localImage;
                                                            iPath = image.path;
                                                          });

                                                          galeriaStore.setFoto(index, this.image!.path);
                                                          galeriaStore.setData(
                                                              index, DateFormat('dd/MM/yyyy').format(DateTime.now()).toString());
                                                          galeriaStore.addToEncontrados(index);
                                                        }

                                                        Future<ImageSource?> sourceI(BuildContext context) async {
                                                          return await showModalBottomSheet(
                                                              context: context,
                                                              builder: (context) => Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    children: [
                                                                      ListTile(
                                                                        leading:
                                                                            Icon(Icons.camera_alt, color: Theme.of(context).primaryColor),
                                                                        title: Text(
                                                                          'Câmara',
                                                                        ),
                                                                        onTap: () {
                                                                          Navigator.of(context).pop(ImageSource.camera);
                                                                        },
                                                                      ),
                                                                      ListTile(
                                                                        leading:
                                                                            Icon(Icons.photo_album, color: Theme.of(context).primaryColor),
                                                                        title: Text(
                                                                          'Galeria',
                                                                        ),
                                                                        onTap: () {
                                                                          Navigator.of(context).pop(ImageSource.gallery);
                                                                        },
                                                                      )
                                                                    ],
                                                                  ));
                                                        }

                                                        final source = await sourceI(context);
                                                        pickImage(source);
                                                      },
                                                      icon: Icon(Icons.camera_alt_rounded, color: Colors.white60))),
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: 220,
                                              child: Text(
                                                galeriaStore.fotosNE[index].dinossauro,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.black),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ))),
                          SizedBox(height: index == galeriaStore.fotosNE.length - 1 ? 10 : 0)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}

class HeroImage extends StatefulWidget {
  HeroImage(@required this.index, @required this.path, {Key? key}) : super(key: key);

  final String path;
  final int index;
  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Hero(
          tag: widget.index,
          child: Image.file(
            File(widget.path),
            width: 300,
            height: 400,
          ),
        )));
  }
}
