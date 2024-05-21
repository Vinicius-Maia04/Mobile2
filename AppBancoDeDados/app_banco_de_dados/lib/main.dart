import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));

  // getDatabasesPath pega o caminho do banco de dados
  final database = openDatabase(join(await getDatabasesPath(), 'dogs.db'),
  onCreate: (db, version){
    db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, nome TEXT, idade INTEGER)');
  }, version: 1);

  // Salva Informação
  Future<void> insertDog(Dog dog) async {
    final db = await database; // Armazena em db o Banco de Dados
    // conflictAlgorihm caso de erro tenta sobrescrever
    db.insert('dogs', dog.toMap(),conflictAlgorithm: ConflictAlgorithm.replace); // Salva a informação
  }

  // Listar informações Salvas
  Future<List<Dog>> dogs() async {
    // Get a reference to the database
    final db = await database;

    // Query the table for all the dogs
    final List<Map<String,Object?>> dogMaps = await db.query('dogs');

    // Convert the list of each dog's fields into a list of `Dog` objects
    return[
      for (final{
        'id': id as int,
        'nome': nome as String,
        'idade': idade as int,
      } in dogMaps)
      Dog(id: id, nome: nome, idade: idade),
    ];
  }

  // Função para alterar dados já salvos no banco de dados
  Future<void> updateDog(Dog dog)async{
    final db = await database;
    await db.update('dogs', dog.toMap(), where: 'id = ?', whereArgs: [dog.id]);
  }
  
  // Função delete
  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
    print('Deletando Dados');
  }

  // Informações Salvas
  var Rocky = Dog(
    id: 1,
    nome: 'Rocky',
    idade: 2
  );
  var Marley = Dog(
    id: 3,
    nome: 'Marley',
    idade: 5,
  );
  var Jacare = Dog(
    id: 2,
    nome: 'Jacare',
    idade: 13,
  );
  insertDog(Jacare);
  Rocky = Dog(
    id: Rocky.id,
    nome: Rocky.nome,
    idade: Rocky.idade + 7,
  );
  await updateDog(Rocky);
  print(await dogs());

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('App Banco de Dados'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('App Banco de Dados'),
          ],
        ),
      ),
    );
  }
}

// Classe Dog
class Dog{
  final int id;
  final String nome;
  final int idade;
  Dog({required this.id, required this.nome, required this.idade});

  // Função que converte os dados para formato Map
  Map<String,Object?> toMap(){
    return{
      'id' : id,
      'nome' : nome,
      'idade' : idade
    };
  }

    @override
      String toString(){
        return 'Dog{id: $id, nome: $nome, idade: $idade}';
      }

}

