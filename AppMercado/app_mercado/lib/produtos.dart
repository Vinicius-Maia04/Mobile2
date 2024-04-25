import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}
  List produtos = [];
class _ProdutosState extends State<Produtos> {

  String url = 'http://10.109.83.12:3000/produtos';
  List produtos = [];

  _getProducts()async{
    http.Response resposta = await http.get(Uri.parse(url));
   produtos = json.decode(resposta.body);
    for(int i =0; i<produtos.length; i++)
    {
      print(produtos[i]);
    }
    setState(() {
      // dado.map vai converter nosso json em uma lista
      produtos = produtos.map((json) => Produto.fromJson(json)).toList();
    });
   
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProducts();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('App Mercado - Lista de Produtos'),),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15)),
            Text('Lista de Produtos', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green
            ),),
            Padding(padding: EdgeInsets.all(15)),
            Container(
              color: Color.fromARGB(255, 209, 209, 209),
              width: MediaQuery.of(context).size.width/1.03,
              child: Column(
                children: produtos.map((produto)=>Text('\n${produto.nome}\nR\$${produto.valor}\nQuantidade: ${produto.quantidade}',
                style: TextStyle(fontSize: 18),)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Produto{
  String id;
  String nome;
  String valor;
  String quantidade;
  Produto(this.id, this.nome, this.valor, this.quantidade);
  // Função factory é a função responsável por decodificar o dado json consumido através da api
  factory Produto.fromJson(Map<String,dynamic>json){
    return Produto(json["id"],json["nome"],json["valor"], json["quantidade"]);
  }  
}
// Classe produto_n para armazenar a lista total de produtos
class Produto_n{
  List prod =[];
  Produto_n(this.prod);
}

// Widget produto(BuildContext context){
//   return Stack(
//     children: <Widget>[
//       Container(
//         color: Color.fromARGB(255, 209, 209, 209),
//         width: MediaQuery.of(context).size.width/1.03,
//         height: MediaQuery.of(context).size.height/8,
//         child: Row(
//           children: [
//             Container(
//               color: Colors.amber,
//               width: MediaQuery.of(context).size.width/4,
//               height: MediaQuery.of(context).size.height/7.9,
//             )
//           ],
//         ),
//       )
//     ],
//   );
// }