import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorScreen()
    );
  }
}


class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});
  
  @override
  // Variavel state que monitora os widgets da classe
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectIndex =0;
  // TextStyle tipo de variavel para receber parametros de acordo com o tipo da fonte do texto
  static const TextStyle optionStyle = TextStyle(fontSize:30,fontWeight: FontWeight.bold);
  // Cria uma lista de widgets para utilizar no navigator bar
  static const List<Widget> _widgetOptions= <Widget> [
    TelaHome(),
    TelaBrasil(),
    TelaIraque(),
    TelaItalia(),
    TelaFranca(),

  ];
  // Funçao que muda o index conforme o icone é pressionado
  void showItemTrap(int index){
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Widget Scaffold 
    return Scaffold(
      // Center centraliza o widget
      body: Center(
        // .elementAt permite passar um numero como index para o widget
        child: _widgetOptions.elementAt(selectIndex),
      ),
      // criar o bottom navigator

       bottomNavigationBar: BottomNavigationBar(
        // itens é cada item do navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Brasil',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fireplace),
            label: 'Iraque',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza),
            label: 'Itália',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cell_tower),
            label: 'França',
            backgroundColor: Colors.red,
          ),
          ],
           currentIndex: selectIndex,
        selectedItemColor: Colors.white,
        onTap:showItemTrap ,
    ));
  }
}

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home', style: TextStyle(fontSize: 30),)),
      ),
      body: Container(
        width: 400,
        color: Color.fromARGB(255, 91, 179, 252),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, size: 100, color: Colors.white,),
              Text('Home', style: TextStyle(fontSize: 30, color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}

class TelaBrasil extends StatefulWidget {
  const TelaBrasil({super.key});

  @override
  State<TelaBrasil> createState() => _TelaBrasilState();
}

class _TelaBrasilState extends State<TelaBrasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Brasil', style: TextStyle(fontSize: 30),)),
      ),
      body: Container(
        width: 400,
        color: Colors.lightGreen,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: Image.network('https://i.redd.it/vht0w2bj2jvb1.jpg', width: 200, height: 350,)),
              Text('Pizza de Feijão 😋', style: TextStyle(fontSize: 30, color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}

class TelaIraque extends StatefulWidget {
  const TelaIraque({super.key});

  @override
  State<TelaIraque> createState() => _TelaIraqueState();
}

class _TelaIraqueState extends State<TelaIraque> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('Iraque', style: TextStyle(fontSize: 30),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://s2-g1.glbimg.com/zOGWwD5QVxzsvKuN7UgxJk12w30=/0x0:1700x1065/1008x0/smart/filters:strip_icc()/s.glbimg.com/jo/g1/f/original/2016/10/18/municao.jpg',
            width: 250,),
            Text('Tiro 😋', style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}

class TelaItalia extends StatefulWidget {
  const TelaItalia({super.key});

  @override
  State<TelaItalia> createState() => _TelaItaliaState();
}

class _TelaItaliaState extends State<TelaItalia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Itália', style: TextStyle(fontSize: 30),)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://cdn.motor1.com/images/mgl/m7o94/s3/ferrari-sf90-spider.jpg', width: 250,),
            Text('FRANCISCO VERGOLINI', style: TextStyle(fontSize: 25),),
            Text('INHAAAAAAAUUUUUNNN', style: TextStyle(fontSize: 25),)
          ],
        ),
      ),
    );
  }
}

class TelaFranca extends StatefulWidget {
  const TelaFranca({super.key});

  @override
  State<TelaFranca> createState() => _TelaFrancaState();
}

class _TelaFrancaState extends State<TelaFranca> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 89, 255),
        title: Center(child: Text('França', style: TextStyle(fontSize: 30),)),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
