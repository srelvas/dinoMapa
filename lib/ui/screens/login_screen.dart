// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_mapa/models/user.dart';
import 'package:dino_mapa/ui/screens/home.dart';
import 'package:dino_mapa/ui/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //GoogleSignInAccount? user = _googleSignIn.currentUser;

    final emailField = TextFormField(
        cursorColor: Theme.of(context).colorScheme.primary,
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor insere o teu e-mail");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return ("Por favor insere um email válido");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.all(0),
          hintText: "E-mail",
          hintStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordField = TextFormField(
        cursorColor: Theme.of(context).colorScheme.primary,
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("A senha é obrigatória");
          }
          if (!regex.hasMatch(value)) {
            return ("Insere uma senha válida (Min. 6 caracteres)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.vpn_key_sharp),
          contentPadding: EdgeInsets.all(0),
          hintText: "Senha",
          hintStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0XFFF75701),
      child: MaterialButton(
          padding: EdgeInsets.all(0),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Iniciar Sessão",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          )),
    );

    final loginGoogle = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0XFF4384F4),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          loginGoogleF();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google.png', width: 20),
            SizedBox(width: 10),
            Text(
              "Entra com a Google",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xFFfe8c00),
                  Color(0xFFf83600),
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 180),
                  child: Image.asset('assets/images/logopreto.png', width: 170),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    SizedBox(
                      height: 32,
                      child: Text(
                        "Bem vindo de volta!",
                        style: TextStyle(letterSpacing: -0.2, color: Color(0xCC000000), fontSize: 29),
                      ),
                    ),
                    Text(
                      "Entra na tua conta do Dino Mapa",
                      style: TextStyle(letterSpacing: -0.4, color: Color(0x90000000), fontSize: 14),
                    ),
                    SizedBox(height: 65),
                    Container(
                      height: 400,
                      width: 310,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFDFE2F4),
                            spreadRadius: 1,
                            blurRadius: 0.2,
                            offset: Offset(0, 0),
                          ),
                        ],
                        color: Color(0xFFE6E8F2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              emailField,
                              SizedBox(height: 15),
                              passwordField,
                              SizedBox(height: 20),
                              loginButton,
                              SizedBox(height: 15),
                              Text(
                                "ou",
                                style: TextStyle(color: Colors.black, fontSize: 15),
                              ),
                              SizedBox(height: 15),
                              loginGoogle,
                              SizedBox(height: 15),
                              Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                                Text(
                                  "Ainda não tens conta? ",
                                  style: TextStyle(color: Color(0xFF47525E), fontSize: 12),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                                  },
                                  child: Text(
                                    "Regista-te!",
                                    style: TextStyle(color: Color(0xFF0079FF), fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                )
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future loginGoogleF() async {
    final user = await _googleSignIn.signIn();

    if (user != null) {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _auth.signInWithCredential(credential).then((value) => {
            postDetailsToFirestore(),
            Fluttertoast.showToast(msg: "Iniciou sessão com sucesso - email: " + user.email),
          });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(_auth.currentUser!.email!)));
    } else {
      return;
    }
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
              Fluttertoast.showToast(msg: "Iniciou sessão com sucesso - email: " + email),
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(email))),
            });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          //TODO: TRADUZIR
          case "invalid-email":
            errorMessage = "Email invalido.";
            break;
          case "wrong-password":
            errorMessage = "Password errada.";
            break;
          case "user-not-found":
            errorMessage = "Utilizador não encontrado.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        // Alert(
        //   context: context,
        //   title: errorMessage!,
        //   style: AlertStyle(
        //     isCloseButton: false,
        //     isButtonVisible: false,
        //   ),
        // ).show();
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
  }
}
