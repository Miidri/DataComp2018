DROP TABLE IF EXISTS processed.t_weblog;
CREATE TABLE processed.t_weblog
(
  web_index INT,
  web_date DATE,
  web_start_time TIMESTAMP,
  pc_flag INT,
  unknown1 INT,
  unknown2 INT,
  url CHAR(512),
  domain CHAR(71),
  sub_domain CHAR(80),
  referrer CHAR(128),
  referrer_url CHAR(512),
  referrer_domain CHAR(67),
  web_title CHAR(256),
  web_time INT,
  PRIMARY KEY (web_index, web_date, web_start_time, pc_flag, unknown1, unknown2, url, 
               domain, sub_domain, referrer, referrer_url, referrer_domain, web_title, web_time)
)
DISTRIBUTED BY (web_index, web_date, web_start_time, pc_flag, unknown1, unknown2, url, 
                domain, sub_domain, referrer, referrer_url, referrer_domain, web_title, web_time);
INSERT INTO processed.t_weblog
SELECT
  TO_NUMBER(web_index,'99999'),
  -- TO_DATE(web_date,'YYYY-MM-DD'), --
  CASE 
   WHEN to_number(web_start_time,'999999') >= 250000
    THEN to_timestamp(web_date||'0'||TRIM(to_char(to_number(web_start_time,'999999') - 240000,'99999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day' 
   WHEN to_number(web_start_time,'999999') >= 241000 AND to_number(web_start_time,'999999') < 250000
    THEN to_timestamp(web_date||'00'||TRIM(to_char(to_number(web_start_time,'999999') - 240000,'9999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN to_number(web_start_time,'999999') >= 240100 AND to_number(web_start_time,'999999') < 241000
    THEN to_timestamp(web_date||'000'|| TRIM(to_char(to_number(web_start_time,'999999') - 240000,'999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day' 
   WHEN to_number(web_start_time,'999999') >= 240010 AND to_number(web_start_time,'999999') < 240100
    THEN to_timestamp(web_date||'0000'||TRIM(to_char(to_number(web_start_time,'999999') - 240000,'99')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN to_number(web_start_time,'999999') >= 240000 AND to_number(web_start_time,'999999') < 240010
    THEN to_timestamp(web_date||'00000'|| TRIM(to_char(to_number(web_start_time,'999999') - 240000,'9')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   ELSE to_timestamp(web_date||web_start_time,'YYYY-MM-DDHH24MISS') END AS web_start_datetime
  TO_NUMBER(pc_flag,'9'),
  TO_NUMBER(unknown1,'9'),
  TO_NUMBER(unknown2,'9'),
  url,
  domain,
  sub_domain,
  referrer,
  referrer_url,
  referrer_domain,
  web_title,
  TO_NUMBER(web_time,'9999')
FROM 
  original.t_weblog;
  