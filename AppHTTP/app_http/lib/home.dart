import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Permite os methods https
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _cep = TextEditingController();
  String? logradouro;
  String? bairro;
  String? cidade;
  String? estado;
  String? ddd;

  _consultaCep () async {
    String url = 'https://cep.awesomeapi.com.br/${_cep.text}'; // API para consultar o endereço através do CEP
    http.Response response; // Variável para armazenar a resposta da API
    response = await http.get(Uri.parse(url));
    print('Código de status da API: ${response.statusCode.toString()}');
    print('Resposta da API ${response.body}');

    Map<String, dynamic> dados = json.decode(response.body);
    setState(() {
      logradouro = dados['address'];
      bairro = dados['district'];
      cidade = dados['city'];
      estado = dados['state'];
      ddd = dados['ddd'];
    });
    print('Logradouro: $logradouro');
    print('Bairro: $bairro');
    print('Cidade: $cidade - $estado');
    print('DDD: $ddd');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Consultar CEP')),
        backgroundColor: const Color.fromARGB(255, 139, 0, 163),
      ),
      body: Container(
        width: 2500,
        color: Color.fromARGB(255, 249, 212, 255),
        child: Column(
          children: [
            Row(
              children: [
                Text('CEP:', style: TextStyle(fontSize: 20),),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Digite o CEP que deseja consultar',
              ),
              keyboardType: TextInputType.number,
              controller: _cep,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Logradouro: $logradouro', style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Bairro: $bairro', style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Cidade: $cidade - $estado', style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('DDD: $ddd', style: TextStyle(fontSize: 20),),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: _consultaCep, child: Text('Verificar'), 
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 139, 0, 163))),),
          ],
        ),
      ),
    );
  }
}