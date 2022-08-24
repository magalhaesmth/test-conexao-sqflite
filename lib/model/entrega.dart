class Entrega {
  final dynamic id;
  final String nome;
  final String valor_entrega;
  final String data_entrega;

  Entrega(
      {this.id,
      required this.nome,
      required this.valor_entrega,
      //required this.empresa,
      required this.data_entrega});
}
