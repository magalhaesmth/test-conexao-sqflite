final criarBanco = [
  '''
    CREATE TABLE usuario(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NULL UNIQUE,
      senha TEXT NOT NULL
    )
  '''
];
