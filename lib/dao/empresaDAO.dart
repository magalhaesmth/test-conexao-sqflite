import 'package:sqflite/sqflite.dart';
import 'package:test_dao_sqflite/banco/conexao.dart';
import 'package:test_dao_sqflite/model/empresa.dart';

class EmpresaDAO {
  Future<bool> salvar(Empresa empresa) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO empresa (id, nome, endereco) VALUES (?,?,?)';
    var linhasAfetadas = await db.rawInsert(
        sql, [empresa.id, empresa.nome, empresa.endereco.toString()]);
    return linhasAfetadas > 0;
  }

  Future<bool> alterar(Empresa empresa) async {
    const sql = 'UPDATE empresa SET nome=?, endereco=? WHERE id = ?';
    Database db = await Conexao.abrirConexao();
    var linhasAfetadas =
        await db.rawUpdate(sql, [empresa.nome, empresa.endereco, empresa.id]);
    return linhasAfetadas > 0;
  }

  Future<Empresa> consultar(int id) async {
    late Database db;
    try {
      const sql = 'SELECT * FROM empresa WHERE id = ?';
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este ID');
      Empresa empresa = Empresa(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          endereco: resultado['endereco'].toString());
      return empresa;
    } catch (e) {
      throw Exception('classe EmpresaDAO, método consultar');
    } finally {
      db.close();
    }
  }

  Future<bool> excluir(int id) async {
    late Database db;
    try {
      const sql = 'DELETE FROM empresa WHERE id = ?';
      db = await Conexao.abrirConexao();
      int linhasAfetadas = await db.rawDelete(sql, [id]);
      return linhasAfetadas > 0;
    } catch (e) {
      throw Exception('classe EmpresaDAO, método excluir');
    } finally {
      db.close();
    }
  }
}
