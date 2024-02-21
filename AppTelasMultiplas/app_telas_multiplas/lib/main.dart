import 'package:app_telas_multiplas/tela2.dart';
import 'package:flutter/material.dart'; // Pacote de widgets para o android

// Função principal do aplicativo
void main() {
  // runApp função que constroi a tela do app
  // MaterialApp função do widget para Android
  // home parâmetro inicial para chamar a tela
  runApp(MaterialApp(
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  // Constroi a tela do aplicativo
  Widget build(BuildContext context) {
    // Scaffold layout semipronto para criar o aplicativo
    return Scaffold(
      // AppBar é a barra do aplicativo
      appBar: AppBar(
        title: Text('Aplicativo Aula 03'),
      ),
      // body é o corpo do Scaffold
      body:
      // Column é a coluna do aplicativo 
      Column(
        // mainAxisAlignment é o alinhamento principal do widget Column
        mainAxisAlignment: MainAxisAlignment.center,
        // children estabelece a relação dos demais widgets com a coluna
        children: [
          Container(color: Colors.blue, width: 400, height: 180,
          child: Text('Tela 1', style: TextStyle(fontSize: 25),),),
          // child é a relação com 1 widget
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaSecundaria(),));
          }, child: Text('Tela 2'))
        ]
        ),
    );
  }
}