-- basic analysis for raw data -- 
SELECT
  MAX(house_num),
  MAX(ind_num),
  MAX(qu_genre_code),
  MAX(question_code),
  MAX(answer_code)
FROM
  original.profiledata;