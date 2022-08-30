class Empresa {
  final dynamic id;
  final String nome;
  final String nome_entregador;
  final String valor_entrega;
  final String data_entrega;

  Empresa(
      {this.id,
      required this.nome,
      required this.nome_entregador,
      required this.valor_entrega,
      required this.data_entrega});
}
