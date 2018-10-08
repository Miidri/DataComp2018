-- check primary key1 -- 
SELECT
  COUNT(*)
FROM(
  SELECT
    DISTINCT web_index, web_date, web_start_time, pc_flag, unknown1, unknown2, url, 
             domain, sub_domain, referrer, referrer_url, referrer_domain, web_title, web_time
  FROM
    original.t_weblog
    ) AS test;

-- check default columns --
SELECT
  COUNT(*)
FROM
  original.t_weblog;