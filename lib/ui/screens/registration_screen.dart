// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dino_mapa/models/user.dart';
import 'package:dino_mapa/ui/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final usernameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
        cursorColor: Theme.of(context).colorScheme.primary,
        autofocus: false,
        controller: usernameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ('Insere um nome de utilizador');
          }
          if (!regex.hasMatch(value)) {
            return ('Insere um nome de utilizador valido (Min. 3 caracteres)');
          }
          return null;
        },
        onSaved: (value) {
          usernameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.all(0),
          hintText: "Nome de Utilizador",
          hintStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final emailField = TextFormField(
        cursorColor: Theme.of(context).colorScheme.primary,
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ('Por favor insere o teu email');
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return ('Por favor insere um email válido');
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
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
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ('A senha é obrigatória');
          }
          if (!regex.hasMatch(value)) {
            return ('Insere uma senha válida (min. 6 caracteres)');
          }
        },
        onSaved: (value) {
          passwordEditingController.text = value!;
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

    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordEditingController.text != passwordEditingController.text) {
            return ('As senhas não são iguais');
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.vpn_key_sharp),
          contentPadding: EdgeInsets.all(0),
          hintText: "Confirma a tua senha",
          hintStyle: TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Color(0XFFF75701),
      child: MaterialButton(
          padding: EdgeInsets.all(0),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          child: Text(
            "Registar conta",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.white),
          )),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                    SizedBox(height: 10),
                    Row(children: [
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ]),
                    SizedBox(height: 17),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70),
                        SizedBox(
                          height: 32,
                          child: Text(
                            "Vamos começar!",
                            style: TextStyle(letterSpacing: -0.2, color: Color(0xCC000000), fontSize: 29),
                          ),
                        ),
                        Text(
                          "Cria uma conta para começares a explorar!",
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
                                  usernameField,
                                  SizedBox(height: 15),
                                  emailField,
                                  SizedBox(height: 15),
                                  passwordField,
                                  SizedBox(height: 15),
                                  confirmPasswordField,
                                  SizedBox(height: 25),
                                  signUpButton,
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
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Alert(
            context: context,
            title: e!.message,
            style: AlertStyle(
              isCloseButton: false,
              isButtonVisible: false,
            ),
          ).show();
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "email-already-in-use":
            errorMessage = "Esse email ja esta em uso.";
            break;
          case "invalid-email":
            errorMessage = "Email invalido.";
            break;
          case "weak-password":
            errorMessage = "Password fraca.";
            break;
        }
        Alert(
          context: context,
          title: errorMessage!,
          style: AlertStyle(
            isCloseButton: false,
            isButtonVisible: false,
          ),
        ).show();
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameEditingController.text;

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    Alert(
      context: context,
      title: "Conta criada com sucesso",
      style: AlertStyle(
        isCloseButton: false,
        isButtonVisible: false,
      ),
    ).show();

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Home(userModel.email!)), (route) => false);
  }
}
