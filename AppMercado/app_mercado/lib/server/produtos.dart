import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('App Mercado - Produtos')),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}