import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State <Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = '';

  // Método para calcular o melhor preço
  void calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = 'Digite um valor válido!';
      });
      return;
    }

    // Cálculo da melhor opção
    if (precoAlcool / precoGasolina >= 0.7) {
      setState(() {
        _resultado = 'Gasolina é melhor!';
      });
    } else {
      setState(() {
        _resultado = 'Álcool é melhor!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina?'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/1483/1483336.png',
                    height: 150),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Calcule o melhor preço!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Preço do Álcool',
                    labelStyle: TextStyle(fontSize: 22)),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Preço da Gasolina',
                    labelStyle: TextStyle(fontSize: 22)),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  ),
                  onPressed: calcular,
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  _resultado,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
