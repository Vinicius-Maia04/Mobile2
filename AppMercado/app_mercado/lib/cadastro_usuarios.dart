import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  String users_url = 'http://10.109.83.12:3000/usuarios';
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _postUser(){
    Map<String,dynamic>user={
      "login": "${_loginController.text}",
      "senha": "${_passwordController.text}"
    };
    
    http.post(
      Uri.parse(users_url),
      headers: <String,String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('App Mercado - Cadastro')),
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
                  Text('Cadastrar Novo Usuário',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),),
                  Padding(padding: EdgeInsets.all(5)),
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
                    _postUser();
                  }, child: Text('Cadastrar'), style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),),),
                  
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Cancelar'), style: ButtonStyle(
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