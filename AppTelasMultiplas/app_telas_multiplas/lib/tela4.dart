import 'package:app_telas_multiplas/tela5.dart';
import 'package:flutter/material.dart';

class TelaContador extends StatefulWidget {
  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => TelaContadorState();
}

class TelaContadorState extends State<TelaContador> {
  int cont = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(color: Colors.blueAccent, width: 100, height: 20,
            child: Text('Contagem: ' + '$cont'),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed: (){
            // setState atualiza o valor da variável com base no estado
            setState(() {
              cont++;
            });
          }, child: Icon(Icons.add)),
            ElevatedButton(onPressed: (){
            // setState atualiza o valor da variável com base no estado
            setState(() {
              cont--;
              if (cont <= 0) { cont = 0;}
            });
          }, child: Icon(Icons.remove)),
            ElevatedButton(onPressed: (){
            setState(() {
              cont = 0;
            });
          }, child: Icon(Icons.replay_rounded))
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CampoTexto()));
              }, child: Text('Tela 5')),
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Voltar'))
            ],
          ),
        ],
      ),
    );
  }
}