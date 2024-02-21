import 'package:app_telas_multiplas/tela4.dart';
import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 3'),
      ),
      body: Column(
        children: [
          Container(color: Colors.purple, width: 400, height: 180,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaContador()));
              }, child: Text('Tela 4')),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Voltar')),
            ],
          ),
        ],
      ),
    );
  }
}