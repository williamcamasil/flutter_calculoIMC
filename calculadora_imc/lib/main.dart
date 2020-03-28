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

  //Criando os controladores para os TEXTFIELD
  //Serve para pegar esses valores de uma forma mais fácil
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  //Usado para a validação dos campos do TextFormField, e aparecer mensagem de erro
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";


  //Função
  void _resetFields(){
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;

      double imc = weight / (height * height);

      if(imc < 18.6){
                                      //Transforma em uma string com precisão para mostrar apenas 4 digitos
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 18.6 && imc < 24.9){
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 29.9 && imc < 34.9){
        _infoText = "Obsidade Grau I (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 34.9 && imc < 39.9){
        _infoText = "Obsidade Grau II (${imc.toStringAsPrecision(4)})";
      }else if(imc >= 40){
        _infoText = "Obsidade Grau III (${imc.toStringAsPrecision(4)})";
      }

    });
  }

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
              _resetFields();
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
        //Foi inserido o Form para poder usar o TextFormField e assim usar a validação dos campos
        child: Form(
          key: _formKey,
          child: Column(
            //Todos os elementos que não tiver tamanho definido, serão alargados na horizontal
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Icon(Icons.person_outline, size: 120.0, color: Colors.green,),

              //Peso
              //Mudamos para TextFormField porque ele tem um parametro de validação
              TextFormField(
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
                //adicionando o controlador, adicionado lá em cima
                controller: weightController,

                //Inserido essa função para que peça ao usuário que ele digite o valor
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
              ),

              //Altura
              TextFormField(
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
                //adicionando o controlador, adicionado lá em cima
                controller: heightController,

                //Inserido essa função para que peça ao usuário que ele digite o valor
                validator: (value) {
                  if(value.isEmpty){
                    return "Insira sua Altura!";
                  }
                },
              ),

              Padding(
                //Aplicando espaço no top e bottom do botão
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                //O Container permitiu aumentar o tamanho do widget de botão
                child: Container(
                  height: 50.0,
                  //Botão
                  child: RaisedButton(
                    onPressed: () {
                      //Se o valor for validado, ai sim ele será executado
                      if(_formKey.currentState.validate()){
                        _calculate();
                      }
                    },
                    child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0),),
                    color: Colors.green,
                  ),
                ),
              ),

              //Label
              Text(_infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),)

            ],
          ),
        ),
      ),
    );
  }
}