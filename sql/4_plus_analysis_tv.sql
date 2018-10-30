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
  MIN(watch_time),
  MAX(watch_time),
  MIN(program_time),
  MAX(program_time)
FROM
  edit.tv_orgn_program_2;
  
  
SELECT 
  COUNT(*)
FROM 
  edit.tv_orgn_program_2
WHERE
  program_start_time = '1990-07-01 0:00:00';