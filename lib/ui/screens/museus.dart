// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_museu.dart';
import 'package:dino_mapa/ui/screens/WrappedMultipleChipClasse.dart';
import 'package:dino_mapa/ui/screens/WrappedMultipleChipFilo.dart';
import 'package:dino_mapa/ui/screens/WrappedMultipleChipIntervalo.dart';
import 'package:dino_mapa/ui/screens/hero_dialog_route.dart';
import 'package:dino_mapa/ui/widgets/museu.dart';
import 'package:dino_mapa/ui/widgets/search_noticias.dart';
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
      interiorColor: 0xFFf09f5d,
      exterior: 'assets/images/lourinha_exterior.jpg',
      horarioCompacto: '10-13h/14:30-18h',
      horario: '''De terça a domingo
10h-13h/14h30-18h''',
      exteriorColor: 0xFF46aae0,
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
      numero: '+351 219238563',
      expanded: false,
      categorias: '''Todos:''',
      precos: '''Entrada gratuita''',
      morada: 'Rua do Paço, 20 2710-602 Sintra, Portugal',
      interior: 'assets/images/sintra_interior.jpg',
      interiorColor: 0xFF83BE65,
      exterior: 'assets/images/sintra_exterior.jpg',
      horarioCompacto: '10h-18h',
      horario: '''De terça a domingo
10h00 às 18h00''',
      exteriorColor: 0xFFd99a62,
      name: 'Museu de História Natural de Sintra',
      weekdays: [
        2,
        3,
        4,
        5,
        6,
        7,
      ],
      horarioEntradaManha: '10:00',
      horarioSaidaManha: '18:00',
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
      interior: 'assets/images/museu_nacional_interior2.jpg',
      interiorColor: 0xFFcfd1b6,
      exterior: 'assets/images/museu_nacional_exterior.png',
      horarioCompacto: '10h-17h',
      horario: '''De terça a domingo
10h00 às 17h00''',
      exteriorColor: 0xFF1E79B6,
      name: 'Museu Nacional de História Natural e da Ciência',
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

  String query = "";

  late List<MuseuModel> museus;

  @override
  initState() {
    super.initState();
    museus = lista;
  }

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
          SizedBox(width: 10),
          GestureDetector(
              child: Hero(
                tag: 'faq',
                child: Icon(Icons.help, size: 32, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return FAQ();
                }));
              }),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Color(0xFFF2F3F8),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5),
              child: SearchBarN(
                onChanged: search,
                text: query,
                titulo: "Procura pelo nome",
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 15,
                ),
                itemCount: museus.length,
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
                    /*child: */ Column(
                  children: [
                    MuseuWidget(
                      model: museus[index],
                    ),
                    SizedBox(height: index == lista.length - 1 ? 20 : 0)
                  ],
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

  void search(String query) {
    final l = lista.where((nModel) {
      final titulo = nModel.name.toLowerCase();
      final searchQ = query.toLowerCase();

      return titulo.contains(searchQ);
    }).toList();

    setState(() {
      this.query = query;
      this.museus = l;
    });
  }
}

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Hero(
          tag: 'faq',
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 330,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Perguntas mais frequentes",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        )),
                    SizedBox(height: 15),
                    Text(
                      '1. O que significam as diferentes cores no horário?',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Se o horário tem a cor verde no fundo é porque está dentro do horário e poderá entrar no museu, se estiver amarelo então significa que falta menos de 30 minutos para o museu fechar, se está vermelho significa que o museu se encontra fechado.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '2. Como pesquisar por um museu específico?',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Para encontrar um museu específico basta pesquisar pelo seu nome na barra de pesquisa que se situa no canto superior esquerdo.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
