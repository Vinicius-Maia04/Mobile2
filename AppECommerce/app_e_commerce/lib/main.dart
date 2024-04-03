import 'package:app_e_commerce/telaAdmin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int loginType = 0;
  TextEditingController _login = TextEditingController();
  TextEditingController _pass = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Login'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 50),
        children: [
          Center(
            child: Container(
              child: Container(
                child: Image.asset('images/logo.png')),
            ),
          ),
          Center(
            child: Container(
              width: 250,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: _login,
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 4),
                      borderRadius: BorderRadius.circular(50)),
                      labelText:'Login',
                      floatingLabelStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                      )
                    ),
                  ),
                  TextField(
                    controller: _pass,
                    obscureText: true,
                    obscuringCharacter: '•',
                    cursorColor: Colors.red,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 4),
                      borderRadius: BorderRadius.circular(50)),
                      labelText:'Senha',
                      floatingLabelStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 20
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: 
            Container(
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: loginType,
                          onChanged: (value) {
                            setState(() {
                              loginType = 1;
                            });
                          },
                          activeColor: Colors.red,
                          ),
                          Text('Admin', style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 107, 107, 107), fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                    Container(
                      child: Row(
                        children: [
                          Radio(
                          value: 2,
                          groupValue: loginType,
                          onChanged: (value) {
                            setState(() {
                              loginType = 2;
                            });
                          },
                          activeColor: Colors.red,
                          ),
                          Text('Cliente', style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 107, 107, 107), fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Center(
            child: 
            ElevatedButton(onPressed: (){
              if (loginType == 1 && _login.text == 'admin' && _pass.text == 'admin'){
                Navigator.push(context, MaterialPageRoute(builder: (context) => telaAdmin()));
              }
            }, 
            child: Text('Entrar', style: TextStyle(fontSize: 20),),
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),),
          )
        ],
      ),
    );
  }
}