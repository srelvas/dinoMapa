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
    await Future.delayed(const Duration(minutes: 9000), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffa348),
        body: Stack(
          children: [
            Center(
              child: Column(
              
                children: [
                   SizedBox(height: MediaQuery.of(context).size.height/6.2),
                  Image.asset("assets/images/logo.png", height: 170),
                  const SizedBox(height: 12),
                  const Text(
                    "DINO MAPA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xfff75700),
                      fontSize: 40.0,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rampart",
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomPaint(
                painter: HeaderPainter(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                ),
              ),
            ),
            Positioned(
              bottom: 200,
              left: MediaQuery.of(context).size.width / 17,
              child: Image.asset("assets/images/bp3.gif", height: 50),
            ),
            Positioned(
              bottom: 80,
              left: MediaQuery.of(context).size.width / 7,
              child: Image.asset("assets/images/footprints.png",
                  width: 80, height: 90),
            ),
            Positioned(
              bottom: 70,
              left: MediaQuery.of(context).size.width / 2 - 5,
              child: Image.asset("assets/images/footprints2.png", height: 50),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/nova.png", width: 250),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    // Path number 1
    paint.color = const Color(0xff925a3d).withOpacity(1);
    path = Path();
    path.lineTo(0, size.height * 0.16);
    path.cubicTo(0, size.height * 0.16, size.width * 0.06, -0.04,
        size.width * 0.09, size.height * 0.01);
    path.cubicTo(size.width * 0.12, size.height * 0.06, size.width / 5,
        size.height * 0.35, size.width * 0.23, size.height * 0.3);
    path.cubicTo(size.width * 0.27, size.height / 4, size.width * 0.29,
        size.height * 0.35, size.width * 0.29, size.height * 0.35);
    path.cubicTo(size.width * 0.29, size.height * 0.35, size.width * 0.29,
        size.height * 0.58, size.width * 0.34, size.height * 0.52);
    path.cubicTo(size.width * 0.38, size.height * 0.47, size.width / 2,
        size.height * 0.24, size.width * 0.52, size.height * 0.32);
    path.cubicTo(size.width * 0.54, size.height * 0.4, size.width * 0.66,
        size.height * 0.74, size.width * 0.68, size.height * 0.72);
    path.cubicTo(size.width * 0.71, size.height * 0.69, size.width * 0.8,
        size.height * 0.49, size.width * 0.83, size.height * 0.53);
    path.cubicTo(size.width * 0.86, size.height * 0.56, size.width, size.height,
        size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height * 0.16, 0, size.height * 0.16);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
