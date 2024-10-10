import 'package:intl/intl.dart';

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    final formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    String valorFormatado = formatador.format(valor);

    return 'Transferencia{valor: $valorFormatado, numeroConta: $numeroConta}';
  }
}
