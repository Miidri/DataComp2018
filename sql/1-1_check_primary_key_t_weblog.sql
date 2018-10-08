-- check primary key1 -- 
SELECT
  COUNT(*)
FROM(
  SELECT
    DISTINCT 
  FROM
    original.t_weblog
    ) AS test;

-- check default columns --
SELECT
  COUNT(*)
FROM
  original.t_weblog;