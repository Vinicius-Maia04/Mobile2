import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Pets',
      home: PetsScreen(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
    );
  }
}

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  State<PetsScreen> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  late Future<List<Pet>> futurePet;

  // Função do tipo Future que vai receber atualização de dados a partir da api
  Future<List<Pet>> consultaPet() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/giovannamoeller/pets-api/main/db.json'));
    if(response.statusCode == 200) {
      final parsed = jsonDecode(response.body); // Realiza o parse do json da api
      List<dynamic>petJson = parsed['pets'];
      return petJson.map((json) => Pet.fromJson(json)).toList();
    } else {
      print(response.statusCode);
      throw Exception('Falha ao consumir api');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePet = consultaPet(); // Variável para armazenar os dados vindos da api
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Pet'),
      ),
      body: Center(
        child: FutureBuilder<List<Pet>>(
          future: futurePet,
          builder: (context, snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PetListItem(pet: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError){
              return Text('$snapshot.error');
            }
            return CircularProgressIndicator();
          }),
      )
    );
  }
}

class Pet{
  final String nome;
  final String imageurl;
  final String idade;
  final String comportamento;
  final String porte;
  final String location;
  final String tel;

  // Criar  construtor
  Pet({required this.nome, required this.imageurl, required this.idade, required this.comportamento,
  required this.porte, required this.location, required this.tel});

  // Função para separar os dados da api em cada campo da classe
  factory Pet.fromJson(Map<String,dynamic>json){
    return Pet(
      nome: json['name'],
      imageurl: json['imageUrl'],
      idade: json['age'],
      comportamento: json['behavior'],
      porte: json['size'],
      location: json['location'],
      tel: json['phoneNumber']);
  }
}

class PetListItem extends StatelessWidget {
  final Pet pet;

  const PetListItem({Key? key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(pet.imageurl),
      ),
      title: Text(pet.nome),
      subtitle: Text('${pet.idade}, ${pet.comportamento}, ${pet.porte}, ${pet.location}'),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(pet.nome),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Image.network(pet.imageurl),
                    Text('Idade: ${pet.idade}'),
                    Text('Comportamento: ${pet.comportamento}'),
                    Text('Porte: ${pet.porte}'),
                    Text('Localização: ${pet.location}'),
                    Text('Telefone: ${pet.tel}')
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Fechar'),
                  )
              ],
            );
          }
          );
      },
    );
  }
}