DROP TABLE IF EXISTS processed.profiledata;
CREATE TABLE processed.profiledata
(
  house_num
  ind_num 
  qu_genre_code
  question_code
  answer_code 
  PRIMARY KEY ()
)
DISTRIBUTED BY (sample_date, house_num);