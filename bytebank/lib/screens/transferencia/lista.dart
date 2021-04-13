
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferenciasState extends State<ListaTransferencias>{
  //final List<Transferencia> _transferencias = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //widget._transferencias.add(Transferencia(100, 1234));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
        //backgroundColor: Color.fromRGBO(0, 255, 0, 0.5),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida)
          {
            debugPrint('Chegou no then do future');
            debugPrint('$transferenciaRecebida');
            if(transferenciaRecebida !=null){
              setState(() => widget._transferencias.add(transferenciaRecebida));
            }
          });
        },
      ),
    );
  }

}
class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    print('createState');
    return ListaTransferenciasState();
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
