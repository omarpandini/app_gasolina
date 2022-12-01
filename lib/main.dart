// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _logo = AssetImage('images/logo.png');
  final String _texto1 =
      'Saiba qual a melhor opção para abastecimento do seu carro';
  String _resultado = '';

  var _estiloTexto1 = TextStyle(fontSize: 25);
  var _textoMsgErro = TextStyle(fontSize: 20, color: Colors.red);

  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  void _calcular() {
    var precoAlcool = double.tryParse(_textEditingController1.text);
    var precoGasolina = double.tryParse(_textEditingController2.text);

    print(precoAlcool);
    if (precoAlcool == null || precoGasolina == null) {
      _resultado =
          'Atençao, valores inválidos. Utilize somente valores numéricos.';
    } else {
      //Efetua o cálculo
      double _result = precoAlcool / precoGasolina;

      if (_result >= 0.7) {
        _resultado = 'Melhor abastecer com gasolina';
      } else {
        _resultado = 'Melhor abastecer com álcool';
      }

      print('Resultado : ' + _result.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Image(image: this._logo),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 30),
              child: Text(
                _texto1,
                textAlign: TextAlign.start,
                style: _estiloTexto1,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _textEditingController1,
                decoration: InputDecoration(
                    labelText: 'Preço Álcool, ex: 1.59',
                    labelStyle: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _textEditingController2,
                decoration: InputDecoration(
                    labelText: 'Preço Gasolina, ex: 3.59',
                    labelStyle: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _resultado = '';
                        _calcular();
                      });
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _resultado,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
