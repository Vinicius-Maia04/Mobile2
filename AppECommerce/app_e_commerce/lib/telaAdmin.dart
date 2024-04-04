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
          AdminComponents('Cafeteira Makita', 'images/Cafeteira.jpg')
        ],
      ),
    );
  }
}

class AdminComponents extends StatefulWidget {
  final String nome;
  final String img;
  const AdminComponents(this.nome, this.img, {super.key});

  @override
  State<AdminComponents> createState() => AdminComponentsState();
}

class AdminComponentsState extends State<AdminComponents> {
  TextEditingController _price = TextEditingController();
  double price = 0;
  int qtde = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width/2,
                  child: Image.asset('${widget.img}'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width/2,
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
                          Text('Valor: R\$${price.toStringAsFixed(2).replaceAll('.', ',')}', style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Quandidade Disponível: ${qtde}', style: TextStyle(fontSize: 15),),
                        ],
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Qtde: ', style: TextStyle(fontSize: 20),),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                qtde += 1;
                              });
                            }, child: Icon(Icons.add),
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),),
                            ElevatedButton(onPressed: (){
                              setState(() {
                                qtde -= 1;
                                if (qtde<0){
                                  qtde = 0;
                                }
                              });
                            }, child: Icon(Icons.remove),
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Preço:', style: TextStyle(fontSize: 20),),
                          Container(
                            height: 35,
                            width: 75,
                            child: TextField(
                              controller: _price,
                              cursorColor: Colors.red,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey,width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.red, width: 4)
                                )
                                
                              ),
                            ),
                          ),
                          ElevatedButton(onPressed: () {
                            if (_price.text.contains(',')){
                              _price.text = _price.text.toString().replaceAll(',', '.');
                            };
                            setState(() {
                              price = double.tryParse(_price.text) ?? 0;
                              
                            });
                          }, 
                          child: Icon(Icons.check),
                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red),
                          ),
                          ),
                        ]
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ],
        ),
      ],
    );
  }
}
