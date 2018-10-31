-- tv_noがなにを表しているかについて --
SELECT
  tv_num,
  COUNT(tv_num)
FROM 
  processed.tv_orgn_p_cv
WHERE
  data_agg_type = 1 AND dataseq = 1
GROUP BY 
  tv_num;
  
  
-- TV接触ログと番組情報の結合テーブル -- 
SELECT
  house_num,
  COUNT(house_num)
FROM
  edit.tv_orgn_program_2
WHERE
  data_agg_type = 1
GROUP BY
  program_start_time, house_num
ORDER BY 
  COUNT(house_num) DESC;

SELECT 
  COUNT(*)
FROM 
  edit.tv_orgn_program_2
WHERE
  program_start_time = '1990-07-01 0:00:00';