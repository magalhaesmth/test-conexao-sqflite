import 'package:test_dao_sqflite/model/empresa.dart';

class Entrega {
  final dynamic id;
  final String nome_entregador;
  final String valor_entrega;
  final String data_entrega;
  final Empresa empresa;

  Entrega(
      {this.id,
      required this.nome_entregador,
      required this.valor_entrega,
      required this.data_entrega,
      required this.empresa});
}
