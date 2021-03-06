DROP TABLE IF EXISTS processed.t_weblog;
CREATE TABLE processed.t_weblog
(
  house_num INT,
  web_date DATE,
  web_start_datetime TIMESTAMP,
  pc_flag INT,
  sp_flag INT,
  tb_flag INT,
  url CHAR(512),
  domain CHAR(71),
  sub_domain CHAR(80),
  user_agent CHAR(128),
  referrer CHAR(512),
  referrer_domain CHAR(67),
  web_title CHAR(256),
  web_time INT,
  PRIMARY KEY (house_num, web_date, web_start_datetime, url, user_agent, referrer, web_title, web_time)
)
DISTRIBUTED BY (house_num, web_date, web_start_datetime, url, user_agent, referrer, web_title, web_time);

INSERT INTO processed.t_weblog
SELECT
  TO_NUMBER(house_num,'99999'),
  TO_DATE(web_date,'YYYY-MM-DD'),
  CASE 
   WHEN TO_NUMBER(web_start_time,'999999') >= 250000
    THEN TO_TIMESTAMP(web_date||'0'||TRIM(to_char(TO_NUMBER(web_start_time,'999999') - 240000,'99999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day' 
   WHEN TO_NUMBER(web_start_time,'999999') >= 241000 AND TO_NUMBER(web_start_time,'999999') < 250000
    THEN TO_TIMESTAMP(web_date||'00'||TRIM(to_char(TO_NUMBER(web_start_time,'999999') - 240000,'9999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN TO_NUMBER(web_start_time,'999999') >= 240100 AND TO_NUMBER(web_start_time,'999999') < 241000
    THEN TO_TIMESTAMP(web_date||'000'|| TRIM(to_char(TO_NUMBER(web_start_time,'999999') - 240000,'999')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day' 
   WHEN TO_NUMBER(web_start_time,'999999') >= 240010 AND TO_NUMBER(web_start_time,'999999') < 240100
    THEN TO_TIMESTAMP(web_date||'0000'||TRIM(to_char(TO_NUMBER(web_start_time,'999999') - 240000,'99')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   WHEN TO_NUMBER(web_start_time,'999999') >= 240000 AND TO_NUMBER(web_start_time,'999999') < 240010
    THEN TO_TIMESTAMP(web_date||'00000'|| TRIM(to_char(TO_NUMBER(web_start_time,'999999') - 240000,'9')),'YYYY-MM-DDHH24MISS') + INTERVAL '1day'
   ELSE TO_TIMESTAMP(web_date||web_start_time,'YYYY-MM-DDHH24MISS') END AS web_start_datetime,
  TO_NUMBER(pc_flag,'9'),
  TO_NUMBER(sp_flag,'9'),
  TO_NUMBER(tb_flag,'9'),
  url,
  domain,
  sub_domain,
  user_agent,
  referrer,
  referrer_domain,
  web_title,
  TO_NUMBER(web_time,'9999')
FROM 
  original.t_weblog;