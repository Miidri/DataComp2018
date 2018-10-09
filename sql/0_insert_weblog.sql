-- preprocessing by vim -- 
-- :%s/\\/|/g --

DROP TABLE IF EXISTS original.t_weblog;
CREATE TABLE original.t_weblog(
  web_index CHAR(100),
  ind_num CHAR(100),
  web_date CHAR(100),
  web_start_time CHAR(100),
  pc_flag CHAR(100),
  sp_flag CHAR(100),
  tb_flag CHAR(100),
  url TEXT,
  domain TEXT,
  sub_domain CHAR(100),
  user_agent TEXT,
  referrer_url TEXT,
  referrer_domain CHAR(100),
  web_title TEXT,
  web_time CHAR(100)
)
-- 主キーを設定する
DISTRIBUTED BY(web_index);
-- データを挿入する1
COPY
  original.t_weblog
FROM 
  '/home/takut0/data/修正データ2/t_weblog_0000_part_00.tsv' DELIMITER U&'\0009'; 
-- データを挿入する2
COPY 
  original.t_weblog
FROM 
  '/home/takut0/data/修正データ2/t_weblog_0001_part_00.tsv' DELIMITER U&'\0009'; 
-- データを挿入する3
COPY 
  original.t_weblog
FROM 
  '/home/takut0/data/修正データ2/t_weblog_0002_part_00.tsv' DELIMITER U&'\0009'; 
-- データを挿入する4
COPY 
  original.t_weblog
FROM 
  '/home/takut0/data/修正データ2/t_weblog_0003_part_00.tsv' DELIMITER U&'\0009'; 