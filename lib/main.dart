import 'package:dino_mapa/data/dino_data.dart';
import 'package:dino_mapa/models/dinoStore.dart';
import 'package:dino_mapa/models/galeriaStore.dart';
import 'package:dino_mapa/ui/screens/home.dart';
import 'package:dino_mapa/ui/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
   MultiProvider(
     child: App(),
        providers: [
          ChangeNotifierProvider<DinoStore>(
            create: (_) => DinoStore(
               allDinos,
              favoritos,
            ),),
          ChangeNotifierProvider<GaleriaStore>(
            create: (_) => GaleriaStore(
              [

              ],
              [
                GaleriaModel(
                  dinossauro: 'Dinheirosaurus lourinhanensis',
                ),
                GaleriaModel(
                  dinossauro: 'Sauropoda',
                ),
                GaleriaModel(
                  dinossauro: 'Dromaeosauridae',
                ),
                GaleriaModel(
                  dinossauro: 'Apatosaurus alenquerense',
                ),
                GaleriaModel(
                  dinossauro: 'Diagoniella',
                ),
                GaleriaModel(
                  dinossauro: 'Terebratulida',
                ),
                GaleriaModel(
                  dinossauro: 'Deltapodus',
                ),
              ],
            ),    
          ) 
  ]));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), 
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
    );
  }





}