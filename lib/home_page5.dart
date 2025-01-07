import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> respostaFinal = {};
  final dio = Dio();

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://dog.ceo/api/breeds/image/random');
    print(response);
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text('Consumo de APIs usando Dio'),
              ElevatedButton(
                onPressed: () async {
                  final Map<String, dynamic> enderecoAuxiliar = await getHttp();
                  setState(() {
                    respostaFinal = enderecoAuxiliar;
                  });
                },
                child: Text('Consultar'),
              ),
              SizedBox(height: 32),
                Text('Logradouro: ${respostaFinal['logradouro'] ?? 'Ainda não foi buscado'}'),
                Text('Cidade: ${respostaFinal['localidade'] ?? 'Ainda não foi buscado'}'),
                Text('Complemento: ${respostaFinal['complemento'] ?? 'Ainda não foi buscado'}'),
                Text('Bairro: ${respostaFinal['bairro'] ?? 'Ainda não foi buscado'}'),
                Text('Estado: ${respostaFinal['uf'] ?? 'Ainda não foi buscado'}'),
                Text('CEP: ${respostaFinal['cep'] ?? 'Ainda não foi buscado'}'),
                Text('Região: ${respostaFinal['regiao'] ?? 'Ainda não foi buscado'}'),
            ],
          ),
        )
      ),
    );
  }
}


