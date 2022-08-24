final criarBanco = [
  '''
    CREATE TABLE usuario(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NULL UNIQUE,
      veiculo TEXT NOT NULL,
      senha TEXT NOT NULL

    )
  ''',
  //'''
  //CREATE TABLE empresa(
  //id INTEGER NOT NULL PRIMARY KEY,
  //nome TEXT NULL UNIQUE,
  //senha TEXT NOT NULL
  //)
  //''',
  '''
    CREATE TABLE entrega(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL UNIQUE,
      valor_entrega DOUBLE,
      data_entrega DATE,
    )
  '''
  //empresa_nome INTEGER,
  //FOREIGN KEY (empresa_nome) references empresa (nome) - Tentar usar isso depois
];


//