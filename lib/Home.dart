import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _BRL = "Clique em atualizar";

  _atualizaPreco() async {
    http.Response response;
    String url = "https://blockchain.info/ticker";

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _BRL = "R\$ " + retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/bitcoin.png",
              width: 300,
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                _BRL,
                style: TextStyle(fontSize: 32),
              ),
            ),
            RaisedButton(
              child: Text("Atualizar"),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {
                _atualizaPreco();
              },
            ),
          ],
        ),
      ),
    );
  }
}
