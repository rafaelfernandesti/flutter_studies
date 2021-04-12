import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(title: Text('Bytebank - 0 seu banc0 d1g1tal'),),
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerCampoNumeroConta,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  labelText: 'Número da conta', hintText: '0000'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerCampoValor,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint('clicou');
              final int numeroConta =
              int.parse(_controllerCampoNumeroConta.text);
              final double valor = double.parse(_controllerCampoValor.text);
              if(numeroConta != null && valor != null){
                Transferencia transferenciaCriada =
                Transferencia(valor, numeroConta);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$transferenciaCriada'),
                    ),
                );
                debugPrint(transferenciaCriada.toString());
              }
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        backgroundColor: Color.fromRGBO(0, 255, 0, 0.5),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(10, 1111)),
          ItemTransferencia(Transferencia(20, 2222)),
          ItemTransferencia(Transferencia(30, 3333)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('Teste'),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  } //criar construtor com Alt + Insert no IntelliJ

  Transferencia(this.valor, this.numeroConta);
}
