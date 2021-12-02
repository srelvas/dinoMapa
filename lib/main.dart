import 'package:dino_mapa/ui/screens/dino_mapa.dart';
import 'package:dino_mapa/ui/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Color(0XFFF75701),
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0XFFF75701),
        ),
        inputDecorationTheme: const InputDecorationTheme(),
        primaryColor: const Color(0XFFF75701),
        fontFamily: 'Hammersmith',
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color(0XFFF75701),
            ),
      ),
    ),
  );
}
