import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(minutes: 15), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xffffa348),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Image.asset("assets/images/logo.png",
            width: 180,
            height: 170),
            const SizedBox(height: 25),
            const  Text(
                    "DinoMapa", 
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      color: Color(0xfff75700), 
                      fontSize: 40.0, 
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          "SourceSansPro-SemiBold", 
                    ),
                  ),
                  const SizedBox(height: 200),
                  Image.asset("assets/images/nova.png", width: 250),
    ]),
      )));
  }
}
