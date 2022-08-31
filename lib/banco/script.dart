final criarBanco = [
  '''
    CREATE TABLE empresa(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NULL UNIQUE,
      endereco TEXT NOT NULL
    )
  ''',
  '''
    CREATE TABLE entrega(
      id INTEGER NOT NULL PRIMARY KEY,
      nome_entregador TEXT NOT NULL UNIQUE,
      valor_entrega TEXT NOT NULL,
      data_entrega TEXT NOT NULL,
      empresa_id INTEGER NOT NULL,
      FOREIGN KEY(empresa_id) REFERENCES empresa(id)
    )
  '''
];
