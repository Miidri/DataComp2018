DROP TABLE IF EXISTS original.profilemaster;
CREATE TABLE original.profilemaster(
  qu_genre_code CHAR(100),
  qu_genre CHAR(100),
  question_code CHAR(100),
  question CHAR(100),
  question_type CHAR(100),
  answer_code CHAR(100),
  answer CHAR(100)
)
-- 主キーを設定する
DISTRIBUTED BY(qu_genre_code,question_code, answer_code);
-- データを挿入する
COPY 
  original.profilemaster
FROM 
  '/home/takut0/data/ProfileMaster.csv' WITH CSV; 