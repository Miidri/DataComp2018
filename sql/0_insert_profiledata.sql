DROP TABLE IF EXISTS original.profiledata;
CREATE TABLE original.profiledata(
  house_num char(10),
  tmp char(10), -- 不要列, 前処理において削除する
  qu_genre_code CHAR(10),
  question_code CHAR(10),
  answer_code CHAR(10)
)
-- 主キーを設定する
DISTRIBUTED BY(house_num,qu_genre_code,question_code,answer_code);
-- データを挿入する
COPY 
  original.profiledata 
FROM 
  '/home/takut0/data/ProfileData_2.csv' CSV HEADER; 