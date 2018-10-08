DROP TABLE IF EXISTS processed.t_weblog;
CREATE TABLE processed.t_weblog
(
  web_index CHAR(100),
  ind_num CHAR(100),
  web_date CHAR(100),
  web_start_time CHAR(100),
  pc_flag CHAR(100),
  unknown1 CHAR(100),
  unknown2 CHAR(100),
  url TEXT,
  domain TEXT,
  sub_domain CHAR(100),
  referrer TEXT,
  referrer_url TEXT,
  referrer_domain CHAR(100),
  web_title TEXT,
  web_time CHAR(100),
  PRIMARY KEY ( )
)
DISTRIBUTED BY ( );
INSERT INTO processed.t_weblog
SELECT
  TO_NUMBER(qu_genre_code,'99'),
  qu_genre,
  TO_NUMBER(question_code,'999'),
  question,
  question_type,
  TO_NUMBER(answer_code,'999'),
  answer
FROM 
  original.t_weblog;
   