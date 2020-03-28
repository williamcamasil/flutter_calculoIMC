import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra superior com titulo
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        //centralizar o texto
        centerTitle: true,
        //mudar a cor de fundo
        backgroundColor: Colors.green,
        //colocando o botão de recarregar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {

            },
          )
        ],
      ),
      //Mudando a cor de fundo do app
      backgroundColor: Colors.white,

      //Agora iremos mexer no body do app
      //Esse SingleChildScrollView serve para permitir o scroll da tela e assim evitar erro de tela insuficiente
      body: SingleChildScrollView(
        //O proprio Single.. tem o padding para espaçamento
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          //Todos os elementos que não tiver tamanho definido, serão alargados na horizontal
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.green,),

            //Peso
            TextField(
              //Habilita a escrita de somente numero
              keyboardType: TextInputType.number,
              //Inserção de texto e estilo dento do TextField
              decoration: InputDecoration(
                labelText: "Peso (Kg)",
                labelStyle: TextStyle(color: Colors.green),
              ),

              //Centraliza o texto que será digitado
              textAlign: TextAlign.center,
              //Mexe no estilo do TextField
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            ),

            //Altura
            TextField(
              //Habilita a escrita de somente numero
              keyboardType: TextInputType.number,
              //Inserção de texto e estilo dento do TextField
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.green),
              ),

              //Centraliza o texto que será digitado
              textAlign: TextAlign.center,
              //Mexe no estilo do TextField
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            ),

            Padding(
              //Aplicando espaço no top e bottom do botão
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              //O Container permitiu aumentar o tamanho do widget de botão
              child: Container(
                height: 50.0,
                //Botão
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                  color: Colors.green,
                ),
              ),
            ),

            //Label
            Text("Info",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),)

          ],
        ),
      ),
    );
  }
}