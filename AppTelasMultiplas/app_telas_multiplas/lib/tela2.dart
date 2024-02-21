import 'package:app_telas_multiplas/tela3.dart';
import 'package:flutter/material.dart';

class TelaSecundaria extends StatelessWidget {
  const TelaSecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),
      ),
      body:Column(
        children: [
          Container(color: Colors.red, width: 400, height: 180),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tela3()));
              }, child: Text('Tela 3')),
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