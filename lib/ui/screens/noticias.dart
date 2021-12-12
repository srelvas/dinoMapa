// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_this
import 'package:dino_mapa/models/model_noticia.dart';
import 'package:dino_mapa/ui/screens/noticias_expanded.dart';
import 'package:dino_mapa/ui/widgets/noticias_widget.dart';
import 'package:dino_mapa/ui/widgets/search_noticias.dart';
import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  const Noticias({Key? key}) : super(key: key);

  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  List<NoticiaModel> lista = [
    NoticiaModel(
        data: '2 de Novembro 2021',
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
        titulo: 'Novo dinossauro Sauropode tem nome que alude ao Atlântico e à música de Björk',
        visivel: true,
        cor: Color(0xFFEE6F68),
        fonte: 'Diário de Notícias'),
    NoticiaModel(
        data: '29 de Outubro 2021',
        imagem: "assets/images/not1.jpg",
        subtitulo:
            'Fósseis de uma nova espécie de réptil marinho da era dos dinossauros, descoberto em Portugal, vão ser mostrados ao público pela primeira vez, a partir de sábado, no Dino Parque da Lourinhã, onde estão expostos até final do verão.',
        texto:
            ''''O 'Plesiopharos moelensis' , uma nova espécie de réptil marinho da era dos dinossauros, que habitou a terra há cerca de 195 milhões de anos, é a estrela da nova exposição temporária do Dino Parque da Lourinhã, no distrito de Lisboa.

Os fósseis, que estarão patentes ao público pela primeira vez, são parte do "mais antigo e completo exemplar da Península Ibérica do réptil com "uma forma que o associa facilmente à silhueta do célebre monstro do Lago Ness", divulgou o Dino Parque.

Os fósseis foram descobertos por dois colecionadores, Victor Teixeira e António Domingos, em São Pedro de Moel, no concelho da Marinha Grande, após o que foram doados ao Museu da Lourinhã e preparados, no laboratório do Dino Parque, por uma equipa internacional de paleontólogos e geólogos ligados a várias instituições.

O trabalho, publicado na revista Acta Palaeontologica Polonica, foi liderado por Simão Mateus, Diretor Científico do Dino Parque, e teve como primeiro autor Eduardo Puértolas-Pascual, investigador da Faculdade de Ciências e Tecnologia da Universidade Nova de Lisboa.

Citado numa nota de imprensa do Parque, Simão Mateus adianta que o Plesiopharos "vai ser um fóssil de destaque na compreensão da evolução dos répteis marinhos nesta zona do Atlântico que, à altura, se estava a formar".

A exposição temporária dará a conhecer não apenas os fósseis do 'Plesiopharos moelensis', mas também a evolução dos plesiossauros e outros répteis marinhos da era dos dinossauros, as primeiras descobertas e a importância geológica da área de São Pedro de Moel.

Os achados poderão ser vistos até ao fim do verão no Dino Parque da Lourinhã, inaugurado em fevereiro de 2018 e considerado o maior museu ao ar livre da Europa, tanto em área expositiva, como em dimensão.

Com 180 modelos de animais à escala real, o Dino Parque proporciona uma viagem de milhões de anos através de cinco percursos distintos: Paleozoico, Triásico, Jurássico, Cretácico e Monstros Marinhos.''',
        titulo: 'Réptil marinho da era dos dinossauros vai ser mostrado ao público',
        visivel: true,
        cor: Color(0xFF23b9d7),
        fonte: 'Sic Notícias'),
    NoticiaModel(
        titulo: 'Descoberta nova espécie de dinossauro carnívoro na região Oeste',
        data: '29 de Outubro 2021',
        imagem: "assets/images/not5.jpg",
        subtitulo:
            'Uma nova espécie de dinossauro carnívoro terópode, cujos fósseis foram escavados em arribas dos concelhos de Torres Vedras e da Lourinhã, foi agora descrito por paleontólogos portugueses e espanhóis.',
        texto:
            '''Um novo género e espécie de dinossauro carnívoro terópode, cujos fósseis foram escavados em arribas dos concelhos de Torres Vedras e da Lourinhã, foi agora descrito na revista internacional “Journal of Vertebrate Paleontology” por paleontólogos portugueses e espanhóis.
      
      A descoberta do ‘Lusovenator santosi’, com 145 milhões de anos, pertencente ao Jurássico Superior de Portugal, mostra que estes animais estavam presentes no hemisfério norte, 20 milhões de anos antes do que indicava o registo conhecido, concluíram Elisabete Malafaia, Pedro Mocho (Universidade de Lisboa), Fernando Escasso e Francisco Ortega, todos investigadores ligados à Sociedade de História Natural de Torres Vedras e à Universidade Nacional de Educação à Distância de Madrid (Espanha).

O dinossauro que pertence ao grupo dos carcharodontossauros, vem reforçar a tese de que a Península Ibérica é uma “região fundamental para compreender o processo de dispersão deste grupo de animais no hemisfério norte durante o final do Jurássico, vários milhões de anos antes destes dinossáurios se tornarem os maiores predadores terrestres no hemisfério sul, no final do Cretácico”, explicou Elisabete Malafaia à agência Lusa.

A nova espécie foi identificada a partir de restos recolhidos nas duas últimas décadas nas jazidas das praias de Valmitão (Lourinhã) e de Cambelas (Torres Vedras).

De início, os fósseis foram atribuídos ao dinossauro carnívoro terópode ‘Allosaurus’, mas uma análise mais detalhada do material permitiu aos paleontólogos identificar um conjunto de características exclusivas que permitiu estabelecer este novo género e espécie.

Os carcharodontossauros, de que havia registos do Cretáceo Inferior (130 milhões de anos) e no final do Cretáceo (100 milhões de anos), são um grupo de dinossauros carnívoros que inclui alguns dos maiores predadores que habitaram o planeta.

Na Península Ibérica o grupo estava representado apenas pela espécie ‘Concavenator corcovatus’, identificada na jazida de Las Hoyas (Cuenca, Espanha) por alguns dos mesmos investigadores.

O carcharodontossauro mais antigo conhecido foi encontrado na Tanzânia, em África, sendo da mesma altura da nova espécie agora identificada em Portugal, o que, segundo os paleontólogos, “constitui a primeira evidência e a mais antiga deste grupo no hemisfério norte”.

A identificação desta nova espécie amplia a diversidade de dinossauros terópodes conhecidos no Jurássico Superior português, um dos melhores registos fósseis deste período.

O ‘Lusovenator santosi’ foi apelidado em homenagem a José Joaquim dos Santos, um curioso da paleontologia, que, durante mais de 30 anos, descobriu fosseis de dinossauro, guardando-os em casa. Mais tarde, vendeu à Câmara Municipal de Torres Vedras a coleção, que tem vindo a ser estudada por investigadores da Sociedade de História Natural de Torres Vedras.''',
        visivel: false,
        cor: Colors.brown.shade400,
        fonte: 'Observador'),
    NoticiaModel(
        data: '9 de Agosto 2021',
        imagem: "assets/images/dino_dinheirosaurus.jpeg",
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
        titulo: 'Paleontólogos escavam quarto ninho de dinossauro Dinheirossaurus Lorinhanensis',
        visivel: true,
        cor: Color(0xFF456E70),
        fonte: 'Diário de Notícias'),
  ];

  String query = "";

  late List<NoticiaModel> noticias;

  @override
  initState() {
    super.initState();
    noticias = lista;
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
              "Dino Noticias",
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: SearchBarN(
                onChanged: search,
                text: query,
                titulo: "Procura por tema ou data",
              ),
            ),
            //SearchWidget(text: query, onChanged: search, hintText: 'Filtra por dinossauro ou por data'),
            SizedBox(height: 3),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 16,
                ),
                itemCount: noticias.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) =>
                    GestureDetector(
                  onTap: () {
                    setState(() {
                      query = "";
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoticiasExpanded(model: noticias[index], index: index),
                      ),
                    );
                  },
                  child: NoticiaWidget(
                    model: noticias[index],
                    index: index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void search(String query) {
    final l = lista.where((nModel) {
      final titulo = nModel.titulo.toLowerCase();
      final data = nModel.data.toLowerCase();
      final searchQ = query.toLowerCase();

      return titulo.contains(searchQ) || data.contains(searchQ);
    }).toList();

    setState(() {
      this.query = query;
      this.noticias = l;
    });
  }
}
