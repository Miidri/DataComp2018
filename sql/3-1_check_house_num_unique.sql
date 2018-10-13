-- check original house_num --
SELECT
  SUM(CASE WHEN house_num IS NULL THEN 1 ELSE 0 END)
FROM
  processed.tv_sample_p_cv;
    
-- check profiledata NULL SUM -- 
SELECT
  SUM(CASE WHEN A.house_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN B.key IS NULL THEN 1 ELSE 0 END)
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.profiledata
) AS B
ON A.house_num = B.key;
-- check profiledata NULL list up --
SELECT
  A.house_num,
  B.key
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.profiledata
) AS B
ON A.house_num = B.key
WHERE A.house_num IS NULL OR B.key IS NULL;

-- check tv_play_p_cv NULL SUM -- 
SELECT
  SUM(CASE WHEN A.house_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN B.key IS NULL THEN 1 ELSE 0 END)
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.tv_play_p_cv
) AS B
ON A.house_num = B.key;
-- check tv_play_p_cv NULL list up --
SELECT
  A.house_num,
  B.key
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.tv_play_p_cv
) AS B
ON A.house_num = B.key
WHERE A.house_num IS NULL OR B.key IS NULL;

-- check tv_orgn_p_cv NULL SUM -- 
SELECT
  SUM(CASE WHEN A.house_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN B.key IS NULL THEN 1 ELSE 0 END)
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.tv_orgn_p_cv
) AS B
ON A.house_num = B.key;
-- check tv_orgn_p_cv NULL list up --
SELECT
  A.house_num,
  B.key
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.tv_orgn_p_cv
) AS B
ON A.house_num = B.key
WHERE A.house_num IS NULL OR B.key IS NULL;

-- check t_weblog NULL SUM -- 
SELECT
  SUM(CASE WHEN A.house_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN B.key IS NULL THEN 1 ELSE 0 END)
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.t_weblog
) AS B
ON A.house_num = B.key;
-- check t_weblog NULL list up --
SELECT
  A.house_num,
  B.key
FROM
  processed.tv_sample_p_cv AS A
FULL OUTER JOIN(
  SELECT
    DISTINCT(house_num) AS key
  FROM
    processed.t_weblog
) AS B
ON A.house_num = B.key
WHERE A.house_num IS NULL OR B.key IS NULL;
