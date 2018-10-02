DROP TABLE IF EXISTS original.t_weblog;
CREATE TABLE original.t_weblog(
  web_index CHAR(100),
  ind_num CHAR(100),
  web_date CHAR(100),
  web_start_time CHAR(100),
  pc_flag CHAR(100),
  unknown1 CHAR(100),
  unknown2 CHAR(100),
  url CHAR(100),
  domain CHAR(100),
  sub_domain CHAR(100),
  referrer CHAR(100),
  referrer_domain CHAR(100),
  web_title CHAR(100),
  web_time CHAR(100)
)
-- 主キーを設定する
DISTRIBUTED BY(web_index, ind_num, web_date, web_start_time, url);
-- データを挿入する1
COPY 
  original.t_weblog
FROM 
  '/home/takut0/data/t_weblog_0000_part_00.tsv'; 
-- データを挿入する2
COPY 
  original.t_weblog
FROM 
  '/home/takut0/data/t_weblog_0001_part_00.tsv'; 
-- データを挿入する3
COPY 
  original.t_weblog
FROM 
  '/home/takut0/data/t_weblog_0002_part_00.tsv'; 
-- データを挿入する4
COPY 
  original.t_weblog
FROM 
  '/home/takut0/data/t_weblog_0003_part_00.tsv'; 