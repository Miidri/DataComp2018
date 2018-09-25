CREATE TABLE original.profiledata(
  house_num char(5),
  tmp char(5),
  qu_genre_code INTEGER,
  question_code INTEGER,
  answer_code INTEGER
)
DISTRIBUTED BY(house_num,qu_genre_code,question_code,answer_code);