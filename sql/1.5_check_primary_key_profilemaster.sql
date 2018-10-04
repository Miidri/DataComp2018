-- check primary key1 -- 
SELECT
  COUNT(*)
FROM(
  SELECT
    DISTINCT qu_genre_code,question_code, answer_code
  FROM
    original.profilemaster
    ) AS test;

-- check default columns --
SELECT
  COUNT(*)
FROM
  original.profilemaster;