import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importa o pacote http para o consumo da API

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController value_input = TextEditingController();

  String? _precoBit;

  // Async é porque a função vai esperar uma resposta da API
  _consultaPrecoBitcoin() async{
    
    String url = 'http://blockchain.info/ticker'; // URL da API
    http.Response response = await http.get(Uri.parse(url));
    Map<String,dynamic> dados = json.decode(response.body); // Decodifica a informação vinda da API
    print('Código de status: $response.statusCode.toString()');
    setState(() {
      _precoBit = dados['BRL']['buy'].toString();
    });
    print(_precoBit);

  }
  int inp = 0;
  int out = 0;
  double res = 0;
  _calcular(){
    double valor = double.parse(value_input.text);
    if (inp == 1 && out == 1){
      setState(() {
        res = valor;
      });
    } else if (inp == 1 && out == 2){
      setState(() {
        res = valor / 5.47;
      });
    } else if (inp == 1 && out == 3){
      setState(() {
        res = valor / 5.03;
      });
    } else if (inp == 2 && out == 1){
      setState(() {
        res = valor * 5.47;
      });
    } else if (inp == 2 && out == 2){
      setState(() {
        res = valor;
      });
    } else if (inp == 2 && out == 3){
      setState(() {
        res = valor * 0.92;
      });
    } else if (inp == 3 && out == 1){
      setState(() {
        res = valor * 5.03;
      });
    } else if (inp == 3 && out == 2){
      setState(() {
        res = valor / 0.92;
      });
    } else if (inp == 3 && out == 3){
      setState(() {
        res = valor;
      });
    }
  }

  _limpar() {
    setState(() {
      value_input.text = '';
      res = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Conversor de Moedas', style: TextStyle(fontSize: 30),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 200, height: 100, child: Image.asset('images/bitcoin_logo.png'),),
            Text('Valor do Bitcoin R\$ $_precoBit', style: TextStyle(fontSize: 25),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 220,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: value_input,
                    decoration: InputDecoration(
                      hintText: 'Digite o Valor para Converter'
                    ),
                  ),
                ),
                Container(
                  child: Text('${res.toStringAsFixed(2)}', style: TextStyle(fontSize: 25),),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Origem'),
                Text('Valor Convertido')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(value: 1,
                activeColor: Colors.green,
                groupValue: inp,
                onChanged: (value){
                  setState(() {
                    inp = 1;
                  });
                }),
                Text('Real'),
                Radio(value: 1,
                activeColor: Colors.green,
                groupValue: out,
                onChanged: (value){
                  setState(() {
                    out = 1;
                  });
                }),
                Text('Real')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(value: 2,
                activeColor: Colors.green,
                groupValue: inp,
                onChanged: (value){
                  setState(() {
                    inp = 2;
                  });
                }),
                Text('Euro'),
                Radio(value: 2,
                activeColor: Colors.green,
                groupValue: out,
                onChanged: (value){
                  setState(() {
                    out = 2;
                  });
                }),
                Text('Euro')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(value: 3,
                activeColor: Colors.green,
                groupValue: inp,
                onChanged: (value){
                  setState(() {
                    inp = 3;
                  });
                }),
                Text('Dólar'),
                Radio(value: 3,
                activeColor: Colors.green,
                groupValue: out,
                onChanged: (value){
                  setState(() {
                    out = 3;
                  });
                }),
                Text('Dólar')
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _consultaPrecoBitcoin, child: Text('Verificar'), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),),
                ElevatedButton(onPressed: _calcular, child: Text('Calcular'), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green))),
                ElevatedButton(onPressed: _limpar, child: Text('Limpar'), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

