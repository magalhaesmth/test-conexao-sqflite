import 'package:sqflite/sqflite.dart';
import 'package:test_dao_sqflite/banco/conexao.dart';
import 'package:test_dao_sqflite/model/entrega.dart';

class EntregaDAO {
  Future<bool> salvar(Entrega entrega) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO usuario (id, nome, veiculo, senha) VALUES (?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql, [
      entrega.id,
      entrega.nome,
      entrega.data_entrega,
      entrega.valor_entrega.toString()
    ]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Entrega entrega) async {
    const sql =
        'UPDATE entrega SET nome=?, data_entrega=?, valor_entrega=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas = await db.rawUpdate(sql, [
      entrega.id,
      entrega.nome,
      entrega.data_entrega,
      entrega.valor_entrega.toString()
    ]);
    return linhasAfetadas > 0;
  }

  Future<Entrega> consultar(int id) async {
    late Database db;
    try {
      const sql = 'SELECT * FROM entrega WHERE id = ?';
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este ID');
      Entrega entrega = Entrega(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          data_entrega: resultado['data_entrega'].toString(),
          valor_entrega: resultado['valor_entrega'].toString());
      return entrega;
    } catch (e) {
      throw Exception('classe EntregaDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM entrega WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe EntregaDAO, método excluir');
    } finally {
      db.close();
    }
  }
}
