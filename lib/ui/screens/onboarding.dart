// ignore_for_file: prefer_const_constructors

import 'package:dino_mapa/ui/screens/home.dart';
import 'package:dino_mapa/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  final String email;
  OnBoardingPage(@required this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: Text(
                'Conheça os fósseis de Portugal',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              bodyWidget: Text('Explore o mapa paleontológico de Portugal e conheça novos fósseis.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              image: Padding(
                padding: const EdgeInsets.only(top: 20, left: 9),
                child: Center(
                  child: Image.asset('assets/images/o.png', width: 180),
                ),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: Text(
                'Favorite fósseis',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              bodyWidget: Text('Guarde os seus fósseis favoritos para rápido acesso.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              image: Padding(
                padding: const EdgeInsets.only(top: 20, left: 9),
                child: Center(
                  child: Image.asset('assets/images/fofinho_fav.png', width: 180),
                ),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: Text(
                'Colecione fósseis',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              bodyWidget: Text('Encontre e fotografe fósseis, guardando-os na sua galeria.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              image: Padding(
                padding: const EdgeInsets.only(top: 20, left: 9),
                child: Center(
                  child: Image.asset('assets/images/fofinho_galeria.png', width: 180),
                ),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: Text(
                'Encontre Museus',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              bodyWidget: Text('Descubra novos Museus de fósseis em Portugal.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              image: Padding(
                padding: const EdgeInsets.only(top: 20, left: 9),
                child: Center(
                  child: Image.asset('assets/images/fofinho_museu.png', width: 230),
                ),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: Text(
                'Mantenha-se atualizado',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
              ),
              bodyWidget: Text('Mantenha-se atualizado nos acontecimentos da paleontologia portuguesa.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              image: Padding(
                padding: const EdgeInsets.only(top: 20, left: 9),
                child: Center(
                  child: Image.asset('assets/images/fofinho_news.png', width: 180),
                ),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Começar', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Saltar', style: TextStyle(color: Colors.white)),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward, color: Colors.white),
          dotsDecorator: getDotDecoration(),
          globalBackgroundColor: Color(0xffFF7900),
          skipFlex: 0,
          nextFlex: 0,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Home(email)),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFdedede),
        activeColor: Colors.white,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        boxDecoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xffFF7900),
            Color(0xffBF1401),
          ],
        )),
      );
}
