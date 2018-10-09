-- check primary key1 -- 
SELECT
  COUNT(*)
FROM(
  SELECT
    DISTINCT house_num, web_date, web_start_time, pc_flag, sp_flag, tb_flag, url, 
             domain, sub_domain, user_agent, referrer, referrer_domain, web_title, web_time
  FROM
    original.t_weblog
    ) AS test;
    
-- check primary key2-- 
SELECT
  COUNT(*)
FROM(
  SELECT
    DISTINCT house_num, web_date, web_start_time, url, user_agent, referrer, web_title, web_time
  FROM
    original.t_weblog
    ) AS test;

-- check default columns --
SELECT
  COUNT(*)
FROM
  original.t_weblog;