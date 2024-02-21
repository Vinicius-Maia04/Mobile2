import 'package:flutter/material.dart';
TextEditingController _user = TextEditingController();
TextEditingController _password = TextEditingController();
class CampoTexto extends StatelessWidget {
  const CampoTexto({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campo Texto'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: 'Digite seu Nome'),
            // onSubmitted: (String texto){
            //   print(texto);
            // },
            controller: _user, // Controller é um parâmetro do textfield que armazena o que é digitado
          ),
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: 'Digite sua Senha'),
            obscureText: true, // Comando para esconder o texto digitado
            obscuringCharacter: '•', // Comando para substituir os caracteres digitados
            controller: _password,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                print(_user.text);
                print(_password.text);
              }, child: Text('Exibir')),
              ElevatedButton(onPressed: (){
                _user.text = '';
                _password.text = '';
              }, child: Icon(Icons.cleaning_services)),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Voltar'))
            ],
          )
        ],
      ),
    );
  }
}