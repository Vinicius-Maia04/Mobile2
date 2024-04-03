import 'package:flutter/material.dart';

class telaAdmin extends StatefulWidget {
  const telaAdmin({super.key});

  @override
  State<telaAdmin> createState() => _telaAdminState();
}

class _telaAdminState extends State<telaAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          AdminComponents('Teste', 'images/logo.png', 5, 499.90)
        ],
      ),
    );
  }
}

class AdminComponents extends StatefulWidget {
  final String nome;
  final String img;
  final int qtde;
  final double valor;
  const AdminComponents(this.nome, this.img, this.qtde, this.valor, {super.key});

  @override
  State<AdminComponents> createState() => AdminComponentsState();
}

class AdminComponentsState extends State<AdminComponents> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(25)
              ),
              height: 196,
              width: 196,
              child: Image.asset('${widget.img}'),
            ),
            Container(
              height: 196,
              width: 196,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text('${widget.nome}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Valor: ${widget.valor}', style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Quandidade Disponível: ${widget.qtde}', style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Qtde: ', style: TextStyle(fontSize: 20),),
                        ElevatedButton(onPressed: (){
                          
                        }, child: Icon(Icons.plus_one),
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),),
                        ElevatedButton(onPressed: (){
      
                        }, child: Icon(Icons.replay_outlined),
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      ],
    );
  }
}
