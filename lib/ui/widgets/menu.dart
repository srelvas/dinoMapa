// ignore_for_file: prefer_const_constructors, prefer_final_fields, invalid_required_positional_param, avoid_unnecessary_containers

import 'package:dino_mapa/ui/screens/login_screen.dart';
import 'package:dino_mapa/ui/screens/name_initials_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Menu extends StatefulWidget {
  final String email;
  const Menu(@required this.email, {Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(children: [
      ClipPath(
        clipper: MyClipper(),
        child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: const [Colors.red, Colors.orange]))),
      ),
      Container(
        child: ListView(children: [
          SizedBox(height: 50),
          Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: NameInitialsAvatar(
                widget.email,
                size: 100.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.email,
            ),
            SizedBox(height: 60),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(IconData(60981, fontFamily: 'MaterialIcons'), color: Colors.black26),
              title: Text("O teu perfil", style: TextStyle(color: Colors.black26)),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(IconData(58173, fontFamily: 'MaterialIcons'), color: Colors.black26),
              title: Text("Sobre nós", style: TextStyle(color: Colors.black26)),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(IconData(58751, fontFamily: 'MaterialIcons'), color: Colors.black26),
              title: Text("Definições", style: TextStyle(color: Colors.black26)),
            ),
            ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                leading: Icon(IconData(58291, fontFamily: 'MaterialIcons')),
                title: Text("Terminar Sessão"),
                onTap: () async {
                  await _googleSignIn.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          ]),
        ]),
      ),
    ]));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height - 45);
//     var cp = Offset(50, size.height);
//     var ep = Offset(size.width / 2, size.height);
//     path.quadraticBezierTo(cp.dx, cp.dy, ep.dx, ep.dy);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
