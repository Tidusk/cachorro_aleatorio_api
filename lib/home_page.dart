import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  Map<String, dynamic>? fotocachorro;

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://dog.ceo/api/breeds/image/random');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cães Aleatórios'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text('Clique no botão para sortear um cachorro:'),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(114),
                        child:
                        Image.network('${fotocachorro?['message']??'https:\/\/images.dog.ceo\/breeds\/schnauzer-giant\/n02097130_2942.jpg'}',
                          fit: BoxFit.cover,
                        ),

                      )
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      elevation: WidgetStateProperty.all(0),
                    ),
                    onPressed: () async {
                      Map<String, dynamic>? cachorro = await getHttp();
                      setState(() {
                        fotocachorro = cachorro;
                      });
                    },

                    child: Text('🐾 Sortear',style: TextStyle(color: Colors.white, height: 3))),

              ],
            ),
          )),
    );
  }
}