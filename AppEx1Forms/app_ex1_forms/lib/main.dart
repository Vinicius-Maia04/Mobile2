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
    TelaIndustria(),
    TelaAgricultura(),
    TelaSaude(),
    TelaEconomia(),

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
            icon: Icon(Icons.factory),
            label: 'Indústria',
            backgroundColor: Color.fromARGB(255, 97, 97, 97),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature_people),
            label: 'Agricultura',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Saúde',
            backgroundColor: Color.fromARGB(255, 197, 39, 27),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Economia',
            backgroundColor: Color.fromARGB(255, 187, 146, 22),
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
        title: Center(child: Text('Home')),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 400,
          color: Colors.lightBlueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, size: 100, color: Colors.white,),
              Text('Home', style: TextStyle(fontSize: 30, color: Colors.white))
            ],
          ),
        ),
      )
    );
  }
}

class TelaIndustria extends StatefulWidget {
  const TelaIndustria({super.key});

  @override
  State<TelaIndustria> createState() => _TelaIndustriaState();
}

class _TelaIndustriaState extends State<TelaIndustria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Indústria')),
        backgroundColor: Color.fromARGB(255, 97, 97, 97),
      ),
      body: Container(
        color: Colors.grey,
        width: 400,
        child: Column(
          children: [
            Icon(Icons.factory, size: 100, color: Colors.white,),
            Text('Indústria é uma atividade econômica que surgiu na Primeira Revolução Industrial, no fim do século XVIII e início do século XIX, na Inglaterra, e que tem por finalidade transformar matéria-prima em produtos comercializáveis, utilizando força humana, máquinas e energia.',
            style: TextStyle(fontSize: 30, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}

class TelaAgricultura extends StatefulWidget {
  const TelaAgricultura({super.key});

  @override
  State<TelaAgricultura> createState() => _TelaAgriculturaState();
}

class _TelaAgriculturaState extends State<TelaAgricultura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Agricultura')),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: 400,
        color: Colors.lightGreen,
        child: Column(
          children: [
            Icon(Icons.nature_people, size: 100, color: Colors.white,),
            Text('Agricultura é a prática de cultivar plantas e criar gado. Foi o principal desenvolvimento na ascensão da civilização humana sedentária, por meio da qual o uso de espécies domesticadas criou excedentes de alimentos que permitiram às pessoas viver nas cidades. A história da agricultura começou há milhares de anos.',
            style: TextStyle(fontSize: 30, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}

class TelaSaude extends StatefulWidget {
  const TelaSaude({super.key});

  @override
  State<TelaSaude> createState() => _TelaSaudeState();
}

class _TelaSaudeState extends State<TelaSaude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Saúde')),
        backgroundColor: Color.fromARGB(255, 197, 39, 27),
      ),
      body: Container(
        width: 400,
        color: Colors.red,
        child: Column(
          children: [
            Icon(Icons.health_and_safety, size: 100, color: Colors.white,),
            Text('Como expressão da saúde para todos no século XXI, a saúde universal exige o envolvimento de todos os setores da sociedade para combater a pobreza, a injustiça social, as lacunas educacionais e as condições de vida precárias, entre outros fatores que influenciam a saúde das pessoas.',
            style: TextStyle(fontSize: 30, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}

class TelaEconomia extends StatefulWidget {
  const TelaEconomia({super.key});

  @override
  State<TelaEconomia> createState() => _TelaEconomiaState();
}

class _TelaEconomiaState extends State<TelaEconomia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Economia')),
        backgroundColor: Color.fromARGB(255, 187, 146, 22),
      ),
      body: Container(
        width: 400,
        color: Colors.amber,
        child: Column(
          children: [
            Icon(Icons.monetization_on, size: 100, color: Colors.white,),
            Text('Economia é a ciência que consiste na análise da produção, distribuição e consumo de bens e serviços. Portanto, a economia é o estudo das escolhas dos indivíduos e do que possibilita a compatibilidade nas escolhas de todos.',
            style: TextStyle(fontSize: 30, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}