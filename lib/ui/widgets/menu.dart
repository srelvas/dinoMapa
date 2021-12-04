// ignore_for_file: prefer_const_constructors, prefer_final_fields, invalid_required_positional_param

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
      child: Container(
        color: Color(0xFFF2F3F8),
        child: ListView(
          children: [
            SizedBox(height: 50),
            buildMenu(username: "saas", email: widget.email, auth: _googleSignIn, c: context),
            // fazer menu
            //curva bezier,
          ],
        ),
      ),
    );
  }
}

Widget buildMenu({
  required String username, //ter q ir buscar o user name
  required String email,
  required GoogleSignIn auth,
  required BuildContext c,
}) {
  return Column(children: [
    ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: NameInitialsAvatar(
        email,
        size: 100.0,
      ),
    ),
    SizedBox(height: 10),
    Text(email),
    SizedBox(height: 60),
    ListTile(
      contentPadding: EdgeInsets.only(left: 30),
      leading: Icon(IconData(60981, fontFamily: 'MaterialIcons')),
      title: Text("O teu perfil"),
      /* onTap: () async {
          await auth.signOut();
          Navigator.push(c, MaterialPageRoute(builder: (context) => LoginScreen()));
        } */
    ),
    ListTile(
      contentPadding: EdgeInsets.only(left: 30),
      leading: Icon(IconData(58173, fontFamily: 'MaterialIcons')),
      title: Text("Sobre nós"),
      /* onTap: () async {
          await auth.signOut();
          Navigator.push(c, MaterialPageRoute(builder: (context) => LoginScreen()));
        } */
    ),
    ListTile(
      contentPadding: EdgeInsets.only(left: 30),
      leading: Icon(IconData(58751, fontFamily: 'MaterialIcons')),
      title: Text("Definições"),
      /* onTap: () async {
          await auth.signOut();
          Navigator.push(c, MaterialPageRoute(builder: (context) => LoginScreen()));
        } */
    ),
    ListTile(
        contentPadding: EdgeInsets.only(left: 30),
        leading: Icon(IconData(58291, fontFamily: 'MaterialIcons')),
        title: Text("Terminar Sessão"),
        onTap: () async {
          await auth.signOut();
          Navigator.push(c, MaterialPageRoute(builder: (context) => LoginScreen()));
        }),
  ]); // TODO
}
