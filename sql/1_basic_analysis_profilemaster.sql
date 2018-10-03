-- basic analysis for raw data -- 
SELECT
  MAX(qu_genre_code)),
  MAX(qu_genre),
  MAX(question_code),
  MAX(question),
  MAX(question_type),
  MAX(answer_code),
  MAX(answer)
FROM
  original.profilemaster;