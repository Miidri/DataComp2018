-- basic analysis for raw data -- 
SELECT
  MAX(house_num_len),
  MAX(ind_num_len),
  MAX(qu_genre_code_len),
  MAX(question_code_len),
  MAX(answer_code_len),
  MIN(house_num_len),
  MIN(ind_num_len),
  MIN(qu_genre_code_len),
  MIN(question_code_len),
  MIN(answer_code_len),
  COUNT(DISTINCT(house_num)),
  COUNT(DISTINCT(ind_num)),
  COUNT(DISTINCT(qu_genre_code)),
  COUNT(DISTINCT(question_code)),
  COUNT(DISTINCT(answer_code)),
  SUM(CASE WHEN house_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN ind_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN qu_genre_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN question_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN answer_code IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN house_num='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN ind_num='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN qu_genre_code='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN question_code='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN answer_code='' THEN 1 ELSE 0 END)  
FROM(
  -- 文字列を長さに変換する仮テーブル -- 
  SELECT
    *,
    CHAR_LENGTH(house_num) AS house_num_len,
    CHAR_LENGTH(ind_num) AS ind_num_len,
    CHAR_LENGTH(qu_genre_code) AS qu_genre_code_len,
    CHAR_LENGTH(question_code) AS question_code_len,
    CHAR_LENGTH(answer_code) AS answer_code_len
  FROM
    original.profiledata
) AS length_table;
 