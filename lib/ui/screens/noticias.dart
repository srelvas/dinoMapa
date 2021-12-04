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
      subtitulo:
          'Os autores do estudo escolheram o nome \'Oceanotitan dantasi\', em alusão à costa atlântica, onde foram encontrados os fósseis, à música "oceania" da cantora islandesa e ao paleontólogo português Pedro Dantas.',
      texto:
          '''Paleontólogos portugueses e espanhóis descreveram uma nova espécie de dinossauro herbívoro saurópode, cujos fósseis foram recolhidos há mais de 20 anos numa praia da Lourinhã, num artigo científico agora publicado num boletim especializado.

O 'Oceanotitan dantasi' é descrito como sendo um novo género e uma nova espécie de dinossauro saurópode no artigo "Um novo saurópode macronário do Jurássico Superior de Portugal", publicado no Journal of Vertebrate Paleontology, a que a agência Lusa teve acesso.

Um dos autores, Pedro Mocho, do Instituto Don Luiz da Faculdade de Ciências da Universidade de Lisboa e da Sociedade de História Natural de Torres Vedras, disse à Lusa que, enquanto outros saurópodes já conhecidos atingem grandes dimensões, este animal chamou a atenção dos investigadores "pelo seu tamanho mediano".

As características morfológicas encontradas neste herbívoro "colocava-o fora dos grupos do Jurássico Superior e assemelhava-o a formas do Cretáceo", explicou.

Esta espécie vem contribuir para a enorme diversidade de dinossauros saurópodes encontrados em Portugal com 150 a 145 milhões de anos, pertencentes ao período do Jurássico Superior.

Os autores do estudo escolheram o nome 'Oceanotitan dantasi', em alusão à costa atlântica, onde foram encontrados os fósseis, à música "oceania" da cantora islandesa Björk e ao paleontólogo português Pedro Dantas, um dos responsáveis pelo renascimento da paleontologia de vertebrados em Portugal nos anos 90 do século XX e então paleontólogo do Museu Nacional de História Natural e da Ciência, em Lisboa.

O estudo em que é descrita a nova espécie é também subscrito pelos espanhóis Rafael Royo-Torres, investigador do Museu Aragonês de Paleontologia, e Francisco Ortega, da Universidade Nacional de Educação à Distância de Madrid e da Sociedade de História Natural de Torres Vedras.

Os achados deste dinossauro agora estudado foram feitos em 1996 nas arribas da praia de Valmitão, concelho da Lourinhã, por José Joaquim dos Santos, um cidadão de Torres Vedras que, nos seus tempos livres de carpinteiro, se ocupa a encontrar fósseis de dinossauro e outros animais nas arribas.

Durante mais de 20 anos, José Joaquim dos Santos recolheu alguns milhares de fósseis pertencentes a dinossauros, tartarugas, crocodilos, peixes e até tubarões, cuja coleção foi vendida em 2009 à Câmara de Torres Vedras, para vir a expô-los num futuro museu.

A coleção tem vindo a ser estudada desde essa altura por investigadores associados da Sociedade de História Natural de Torres Vedras.''',
      titulo:
          'Novo dinossauro Sauropode tem nome que alude ao Atlântico e à música de Björk',
      visivel: true,
      cor: Color(0xFF23b9d7),
    ),
    NoticiaModel(
      data: '29 de Outubro 2021',
      imagem: "assets/images/not3.jpg",
      subtitulo:
          'Um quarto ninho de dinossauro foi escavado nas arribas de uma praia da Lourinhã e deverá pertencer ao mesmo dinossauro carnívoro dos anteriores, fazendo deste o local no mundo com mais ninhos de dinossauro.',
      texto:
          '''O paleontólogo Miguel Moreno Azanza, especialista em ninhos e ovos de dinossauros, explicou à agência Lusa que "as cascas são semelhantes às dos ovos dos outros ninhos, por isso tem quase a certeza de que o ninho pertence" ao Lourinhanosaurus antunesi, espécie de dinossauro carnívoro descoberta também neste concelho do distrito de Lisboa, motivo pelo qual foi assim batizada.

Os quatro ninhos têm em comum o facto de terem ovos de 12 centímetros, com cascas negras de um milímetro de espessura e poros que permitem a sua identificação. Os paleontólogos suspeitam que o ninho agora escavado na praia do Caniçal, com cerca de 10 ovos, poderá ser mais antigo do que os anteriores escavados no concelho.

Pela diversidade de ninhos encontrados, os cientistas acreditam que a Lourinhã seria o "local ideal" para os dinossauros carnívoros daquela espécie nidificarem.

A Lourinhã seria uma "área de muitos rios com planícies inundadas, o que era bom para o Lourinhanosaurus antunesi nidificar", apontou Miguel Moreno Azanza, investigador da Universidade Nova de Lisboa, que, com conjunto com Octávio Mateus, da mesma universidade, coordenou as escavações organizadas pelo Museu da Lourinhã.

"Os dinossauros aproveitavam as áreas secas para nidificar e, quando estas inundavam, enterravam os ovos, o que facilitou a sua fossilização", acrescentou.

Pela dimensão dos ninhos e pelo número de ovos, os paleontólogos "suspeitam que várias fêmeas usassem o mesmo ninho para nidificar ou que a mesma fêmea voltasse sempre ao mesmo ninho para pôr ovos".

A Lourinhã foi durante "milhares de anos" usada para os dinossauros nidificarem. Em 2017, quando efetuavam ações de prospeção, três voluntários do museu encontraram uma área de concentração de cascas pretas na arriba da praia do Caniçal. Os paleontólogos começaram a escavar a meio da arriba, trabalhando pendurados por cordas, a uma altura de 17 metros da praia.

O ninho foi escavado nas últimas três campanhas, desde 2017, tendo sido extraído um bloco rochoso a pesar uma tonelada, o qual, por sua vez, foi envolvido em gesso e serapilheira para proteger os fósseis e retirado por guindaste.

O material vai ser estudado e preparado ao vivo no laboratório do Dino Parque da Lourinhã dentro de duas semanas e durante um a dois anos por Miguel Moreno Azanza, Octávio Mateus, Eduardo Puértolas-Pascual, Rute Coimbra e Alexandra Fernandes.

Estes investigadores receberam 240 mil euros de financiamento da Fundação para a Ciência e Tecnologia para estudar a evolução dos ovos de dinossauros a nível mundial, sendo grande parte dos achados oriundos da Lourinhã, por "não haver lugar comparável a nível mundial". A investigação decorre em parceria com universidades dos Estados Unidos da América, Espanha e Correia do Sul.

O Dino Parque prepara-se para realizar visitas às áreas onde foram feitas diversas descobertas para que os visitantes conheçam melhor as características geológicas da região.''',
      titulo:
          'Paleontólogos escavam quarto ninho de dinossauro Dinheirossaurus Lorinhanensis',
      visivel: true,
      cor: Color(0xFF42b422),
    ),
    NoticiaModel(
      data: '29 de Outubro 2021',
      imagem: "assets/images/not1.jpg",
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
              style: TextStyle(
                  letterSpacing: 1.0, color: Colors.white, fontSize: 23),
            ),
          ),
          SizedBox(width: 22),
        ],
      ),
      backgroundColor: Color(0xFFF3AD78),
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
                ) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NoticiasExpanded(model: lista[index]),
                      ),
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
