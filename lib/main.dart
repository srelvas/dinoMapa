import 'package:dino_mapa/ui/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home("teste"), //TODO: MUDAR PA LOGIN
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Color(0xFFFE6E00),
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xFFFE6E00),
        ),
        inputDecorationTheme: const InputDecorationTheme(),
        primaryColor: const Color(0xFFFE6E00),
        fontFamily: 'Hammersmith',
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0xFFFE6E00),
            ),
      ),
    ),
  );
}
