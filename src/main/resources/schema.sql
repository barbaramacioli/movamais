-- Mova+ | schema.sql (SQLite)

CREATE TABLE IF NOT EXISTS usuario (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  perfil          TEXT NOT NULL,
  nome            TEXT NOT NULL,
  email           TEXT UNIQUE NOT NULL,
  senha_hash      TEXT NOT NULL,
  peso            REAL,
  objetivo        TEXT  
);

CREATE TABLE IF NOT EXISTS exercicio (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  nome            TEXT NOT NULL,
  grupo_muscular  TEXT NOT NULL,
  tipo            TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ficha (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  usuario_id      INTEGER NOT NULL,
  nome            TEXT NOT NULL,

  FOREIGN KEY usuario_id REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS item_ficha (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  ficha_id        INTEGER NOT NULL,
  exercicio_id    INTEGER NOT NULL,
  series_alvo     INTEGER NOT NULL,
  reps_alvo       INTEGER NOT NULL,

  FOREIGN KEY ficha_id REFERENCES ficha(id) ON DELETE CASCADE,
  FOREIGN KEY exercicio_id REFERENCES exercicio(id) ON DELETE CASCADE

);

CREATE TABLE IF NOT EXISTS sessao_treino (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  usuario_id      INTEGER NOT NULL,
  ficha_id        INTEGER NOT NULL,
  data_hora       TEXT NOT NULL,
  finalizada      TEXT NOT NULL,

  FOREIGN KEY ficha_id REFERENCES ficha(id) ON DELETE CASCADE,
  FOREIGN KEY usuario_id REFERENCES usuario(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS serie (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  sessao_id       INTEGER NOT NULL,
  exercicio_id    INTEGER NOT NULL,
  numero_serie    INTEGER NOT NULL,
  repeticoes      INTEGER NOT NULL,
  carga_kg        INTEGER NOT NULL,

  FOREIGN KEY sessao_id REFERENCES sessao(id) ON DELETE CASCADE,
  FOREIGN KEY exercicio_id REFERENCES exercicio(id) ON DELETE CASCADE
);

-- 19/11/26: adicionar checks e outras validações que faltam. arquivo tá incompleto.