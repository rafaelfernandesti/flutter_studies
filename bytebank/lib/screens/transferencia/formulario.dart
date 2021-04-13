import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';


const _titulo_appbar = 'Criando transferência';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controllerCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    //CTRL + ALT + M é o atalho para extrair um método
    debugPrint('clicou');
    final int numeroConta = int.parse(_controllerCampoNumeroConta.text);
    final double valor = double.parse(_controllerCampoValor.text);
    if (numeroConta != null && valor != null) {
      Transferencia transferenciaCriada = Transferencia(valor, numeroConta);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
        ),
      );
      Navigator.pop(context, transferenciaCriada);
      debugPrint(transferenciaCriada.toString());
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}
class FormularioTransferenciaState extends State<FormularioTransferencia>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo_appbar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: widget._controllerCampoNumeroConta,
                rotulo: 'Número da conta',
                dica: '0000'),
            Editor(
                controller: widget._controllerCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => widget._criaTransferencia(context),
              child: Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

}
