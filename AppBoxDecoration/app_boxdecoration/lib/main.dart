import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}
class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController _nome = TextEditingController();
  TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Color.fromARGB(255, 53, 53, 53)
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.black,
                      Color.fromARGB(255, 53, 53, 53)
                    ]
                  )
                  ),
                  child: Center(child: Text('Star Wars', style: TextStyle(fontSize: 30, color: Colors.amber, fontWeight: FontWeight.w300),)),
                ),
              ),
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.black,
                      Color.fromARGB(255, 53, 53, 53)
                    ]
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(labelText: 'Digite seu Nome',
                      labelStyle: TextStyle(color: Colors.amber),fillColor: Colors.amber),
                      style: TextStyle(color: Colors.amber),
                      cursorColor: Colors.amber,
                      controller: _nome,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Digite sua Senha', labelStyle: TextStyle(color: Colors.amber)),
                      obscureText: true,
                      obscuringCharacter: '•',
                      style: TextStyle(color: Colors.amber),
                      cursorColor: Colors.amber,
                      controller: _senha,
                    ),
                    ElevatedButton(onPressed: () {
                      if (_nome.text == 'admin' && _senha.text == '12345678') {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaApi()));
                      } else {
                        print('Usuário ou Senha Incorretos!');
                      }
                    }, child: Icon(Icons.account_circle, color: Colors.amber,),
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 56, 56, 56)))
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TelaApi extends StatefulWidget {
  const TelaApi({super.key});

  @override
  State<TelaApi> createState() => _TelaApiState();
}

class _TelaApiState extends State<TelaApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Deu Certo :D')
        ],
      ),
    );
  }
}