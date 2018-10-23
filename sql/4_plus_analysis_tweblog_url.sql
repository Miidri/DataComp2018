-- 調査項目 --
-- 1.urlの連続連続しているもの 
-- 2.referrer -> url -> referrer ...の順路

-- laed(datetime) - datetime = web_time となる件数
SELECT
  COUNT(*)
FROM
  (
  SELECT
    house_num,
    web_start_datetime,
    web_time,
    lead(web_start_datetime) OVER(PARTITION BY house_num ORDER BY web_start_datetime, web_time DESC) AS future_datetime,
    lead(web_start_datetime) OVER(PARTITION BY house_num ORDER BY web_start_datetime, web_time DESC) - web_start_datetime AS lag,
    EXTRACT(EPOCH FROM lead(web_start_datetime) OVER(PARTITION BY house_num ORDER BY web_start_datetime, web_time DESC) - web_start_datetime) AS lag_time
  FROM
    processed.t_weblog
  WHERE
  (house_num, web_start_datetime, web_time)
  IN(
    SELECT
      house_num, web_start_datetime, web_time
    FROM
      processed.t_weblog
    WHERE
      web_time > 0
    GROUP BY
      house_num, web_start_datetime, web_time 
    HAVING
      COUNT(*) = 1)
    ) AS t1
WHERE 
  t1.lag_time <> t1.web_time;

-- house_num, web_start_datetime, web_time についてユニークなカラム
SELECT
  COUNT(*)
FROM
  processed.t_weblog  
WHERE
  (house_num, web_start_datetime, web_time)
  IN(
    SELECT
      house_num, web_start_datetime, web_time
    FROM
      processed.t_weblog
    -- WHERE
    --  web_time > 0
    GROUP BY
      house_num, web_start_datetime, web_time 
    HAVING
      COUNT(*) = 1
  );
