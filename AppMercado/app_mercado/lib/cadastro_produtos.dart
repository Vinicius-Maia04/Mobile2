import 'package:app_mercado/produtos.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cadastro_Produtos extends StatefulWidget {
  const Cadastro_Produtos({super.key});

  @override
  State<Cadastro_Produtos> createState() => _Cadastro_ProdutosState();
}

class _Cadastro_ProdutosState extends State<Cadastro_Produtos> {
  TextEditingController _nomeProduto = TextEditingController();
  TextEditingController _valorProduto = TextEditingController();
  TextEditingController _quantidadeProduto = TextEditingController();
  String url = 'http://10.109.83.12:3000/produtos';

  _postProduct(){
    if (_valorProduto.text.contains(',')){
      _valorProduto.text = _valorProduto.text.toString().replaceAll(',', '.');
    }
    Map<String,dynamic>product={
      "nome": "${_nomeProduto.text}",
      "valor": "${double.tryParse(_valorProduto.text) ?? 0}",
      "quantidade": "${int.tryParse(_quantidadeProduto.text) ?? 0}"
    };
    
    http.post(
      Uri.parse(url),
      headers: <String,String>{
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('App Mercado - Cadastrar Produtos')),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(15)),
                  Text('Cadastrar Novo Produto', style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                  Padding(padding: EdgeInsets.all(5)),
                  TextField(
                    controller: _nomeProduto,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite o Nome do Produto',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.green, width: 4)
                      )
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  TextField(
                    controller: _valorProduto,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      hintText: 'Digite o Valor do Produto',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.green, width: 4)
                      )
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  TextField(
                    controller: _quantidadeProduto,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                      hintText: 'Digite a Quantidade de Produtos',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey, width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.green, width: 4)
                      )
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton(onPressed: (){
                    _postProduct();
                  }, child: Text('Cadastrar Produto'),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Produtos()));
                  }, child: Text('Exibir Produtos'),
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}