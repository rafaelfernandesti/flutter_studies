class Transferencia {
  final double valor;
  final int numeroConta;

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  } //criar construtor com Alt + Insert no IntelliJ

  Transferencia(
    this.valor,
    this.numeroConta,
  );
}
