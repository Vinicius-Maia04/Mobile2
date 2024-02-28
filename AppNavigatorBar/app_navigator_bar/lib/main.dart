import 'package:flutter/material.dart'; // Pacote para o sistema operacional android

// função principal
void main() {
  // Run app é a função que vai chamar a tela do aplicativo
  runApp( NavBottom()); // Material APP é a função necessária para chamar a classe criada
}
// Classe NavBottom do tipo stateless, pois não tem widgets dinamicos
class NavBottom extends StatelessWidget {
  const NavBottom({super.key}); // construtor
 
  @override
  Widget build(BuildContext context) {
    // Scaffold é o layout semipronto do aplicativo
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:   // app bar é a barra do aplicativo
          NavigatorScreen());
    
  }
}

// Classe do tipo Stateful
class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  // Variável state que monitora os widgets da classe
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectIndex = 0;
  // TextStyle tipo de variável para receber parâmetros de acordo com o tipo da fonte do texto
  static const TextStyle optionStyle = TextStyle(fontSize:30, fontWeight: FontWeight.bold);
  // Cria uma lista de widgets para utilizar no navigator bar
  static const List<Widget>_widgetOptions = <Widget> [
    // Text('Index 0: Home', style: optionStyle,),
    TelaHome(),
    // Text('Index 1: Escola', style: optionStyle,),
    CheckBox(),
    // Text('Index 2: Negócio', style: optionStyle,),
    rbState(),
    Text('Index 3: Configurações', style: optionStyle,),
  ];
  // Função que muda o index conforme o ícone é pressionado
  void showItemTrap(int index){
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Widget Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Nav', style: TextStyle(fontSize: 30),),
            Container(
              color: Colors.amber,
              child: Text('Bar', style: TextStyle(color: Colors.black, fontSize: 30),),
              padding: EdgeInsets.all(1),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        // .elementAt permite passar um número como index para o widget
        child: _widgetOptions.elementAt(selectIndex),
      ),
      // Criar o bottom navigator
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Escola',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Negócio',
            backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
            backgroundColor: Colors.black
          ),
        ],
        currentIndex: selectIndex,
        selectedItemColor: Colors.amber,
        onTap: showItemTrap,
      ),
    );
  }
}

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String? msg = 'Mensagem';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container( color: Colors.black,
              child: Center(child: Text('$msg', style: const TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,)),),
            ),
            Column(
              children: [
                ElevatedButton(onPressed: (){
            setState(() {
              msg = 'Senai';
            });
            }, child: Text('Mensagem 1', style: TextStyle(color: Colors.black),),
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
            ),
            ElevatedButton(onPressed: (){
            setState(() {
              msg = 'Mobile 2';
            });
            }, child: Text('Mensagem 2', style: TextStyle(color: Colors.black),),
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
            )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('CheckBox Widget', style: TextStyle(fontSize: 30),),
              Checkbox(
                value: ischeck,
                onChanged: (bool? value){
                  setState(() {
                    ischeck = value !;
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.amber,
                focusColor: Colors.white,
                overlayColor: MaterialStatePropertyAll(Colors.amber),
              ),
              Text('CheckBox é $ischeck', style: TextStyle(fontSize: 30),),
            ],
          ),
        ),
      ),
    );
  }
}

class rbState extends StatefulWidget {
  const rbState({super.key});

  @override
  State<rbState> createState() => _rbStateState();
}

class _rbStateState extends State<rbState> {
  int op = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Text('Radio Button', style: TextStyle(fontSize: 30),),
            RadioListTile<int>(
              title: Text('Opção 1'),
              value: 1,
              groupValue: op,
              onChanged: (value){
                setState(() {
                  op = 1;
                });
              },
              activeColor: Colors.amber,
            ),
            RadioListTile<int>(
              title: Text('Opção 2'),
              value: 2,
              groupValue: op,
              onChanged: (value){
                setState(() {
                  op = 2;
                });
              },
              activeColor: Colors.amber,
            ),
            RadioListTile<int>(
              title: Text('Opção 3'),
              value: 3,
              groupValue: op,
              onChanged: (value){
                setState(() {
                  op = 3;
                });
              },
              activeColor: Colors.amber,
              
            ),
            Text('A opção selecionada é a $op', style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}