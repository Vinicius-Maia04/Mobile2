import 'package:app_login/tela2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TelaLogin(),
  ));
}

TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Login'),
      ),
      body: 
      Column(
        children: [
          Text('Digite seu Login:'),
          TextField(
            keyboardType: TextInputType.name,
            controller: _user,
            ),
            Text('Digite sua Senha'),
            TextField(
              keyboardType: TextInputType.name,
              obscureText: true,
              obscuringCharacter: '•',
              controller: _pass,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  if (_user.text == 'Vinicius_Maia' && _pass.text == 'senha123*'){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Tela2()));
                  } 
                  else {
                    print('Usuário ou Senha Incorretos!');
                  };
                }, child: Text('Login')),
                ElevatedButton(onPressed: (){
                  _user.text = '';
                  _pass.text = '';
                }, child: Text('Limpar'))
              ],
            )
        ],
      ),
    );
  }
}
