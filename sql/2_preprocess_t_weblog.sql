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
  TO_DATE(web_date,'YYYY-MM-DD'),
  -- 要修正 -- 
  CASE WHEN to_number(web_start_time,'999999') >= 2500 THEN to_timestamp(br_date||'0'||TRIM(to_char(to_number(start_time,'9999') - 2400,'999')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(web_start_time,'999999') >= 2410 THEN to_timestamp(br_date||'00'||TRIM(to_char(to_number(start_time,'9999') - 2400,'99')),'YYYY-MM-DDHH24MI') + interval '1day'
	     WHEN to_number(web_start_time,'999999') >= 2400 THEN to_timestamp(br_date||'000'|| TRIM(to_char(to_number(start_time,'9999') - 2400,'9')),'YYYY-MM-DDHH24MI') + interval '1day'
		 ELSE to_timestamp(br_date||start_time,'YYYY-MM-DDHH24MI') END AS br_start_datetime,
  ------------
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
   