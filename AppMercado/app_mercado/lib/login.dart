import 'package:app_mercado/cadastro.dart';
import 'package:app_mercado/server/produtos.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String users_url = 'http://10.109.83.12:3000/usuarios';
  List dados = [];
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _login()async{
    http.Response resposta = await http.get(Uri.parse(users_url));

    dados = json.decode(resposta.body) as List;

    bool enc = false;
    for(int i=0; i<dados.length;){
      if(_loginController.text == dados[i]["login"] && _passwordController.text == dados[i]["senha"]){
        enc = true;
        break;
      } else {
        i++;
      }
    }

    if (enc == true){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Produtos()));
      enc = false;
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('App Mercado - Login')),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(child: 
                      Icon(Icons.group,
                      size: 30,
                      color: Colors.green,)),
                      Padding(padding: EdgeInsets.all(7)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.7,
                        child: TextField(
                          controller: _loginController,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            hintText: 'Digite seu Login',
                            hintStyle: TextStyle(
                              color: Colors.grey
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 4),
                            borderRadius: BorderRadius.circular(20)),
                            labelText: 'Login',
                            floatingLabelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(15),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(child: 
                      Icon(Icons.key,
                      size: 30,
                      color: Colors.green,)),
                      Padding(padding: EdgeInsets.all(7)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.7,
                        child: TextField(
                          controller: _passwordController,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            hintText: 'Digite sua Senha',
                            hintStyle: TextStyle(
                              color: Colors.grey
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 4),
                            borderRadius: BorderRadius.circular(20)),
                            labelText: 'Senha',
                            floatingLabelStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(35)),
                  ElevatedButton(onPressed: (){
                    _login();
                  }, child: Text('Entrar'), style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),),),
                  
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                  }, child: Text('Cadastrar'), style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}