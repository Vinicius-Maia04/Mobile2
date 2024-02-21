import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interface'),
      ),
      body: Column(
        children: [
          Center(child: Text('Boa Mlk', style: TextStyle(fontSize: 50)),)
        ],
      ),
    );
  }
}