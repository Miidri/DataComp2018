-- check primary key1 -- 
SELECT
  COUNT(*)
FROM(
  SELECT
    DISTINCT qu_genre_code, question_code, answer_code
  FROM
    original.profiledata
    ) AS test;

-- check default columns --
SELECT
  COUNT(*)
FROM
  original.profiledata;