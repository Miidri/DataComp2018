-- basic analysis for raw data -- 
SELECT
  -- MAX --
  MAX(web_index_len),
  MAX(web_date_len),
  MAX(web_start_time_len),
  MAX(pc_flag_len),
  MAX(unknown1_len),
  MAX(unknown2_len),
  MAX(url_len),
  MAX(domain_len),
  MAX(sub_domain_len),
  MAX(referrer_len),
  MAX(referrer_url_len),
  MAX(referrer_domain_len),
  MAX(web_title_len),
  MAX(web_time_len),
  -- MIN --
  MIN(web_index_len),
  MIN(web_date_len),
  MIN(web_start_time_len),
  MIN(pc_flag_len),
  MIN(unknown1_len),
  MIN(unknown2_len),
  MIN(url_len),
  MIN(domain_len),
  MIN(sub_domain_len),
  MIN(referrer_len),
  MIN(referrer_url_len),
  MIN(referrer_domain_len),
  MIN(web_title_len),
  MIN(web_time_len),
  -- COUNT DISTINCT -- 
  COUNT(DISTINCT(web_index)),
  COUNT(DISTINCT(web_date)),
  COUNT(DISTINCT(web_start_time)),
  COUNT(DISTINCT(pc_flag)),
  COUNT(DISTINCT(unknown1)),
  COUNT(DISTINCT(unknown2)),
  COUNT(DISTINCT(url)),
  COUNT(DISTINCT(domain)),
  COUNT(DISTINCT(sub_domain)),
  COUNT(DISTINCT(referrer)),
  COUNT(DISTINCT(referrer_url)),
  COUNT(DISTINCT(referrer_domain)),
  COUNT(DISTINCT(web_title)),
  COUNT(DISTINCT(web_time)),
  -- CHECK NULL --
  SUM(CASE WHEN web_index IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_date IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_start_time IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN pc_flag IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN unknown1 IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN unknown2 IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN url IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN domain IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN sub_domain IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer_url IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer_domain IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_title IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_time IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_index='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_date='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_start_time='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN pc_flag='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN unknown1='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN unknown2='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN url='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN domain='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN sub_domain='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer_url='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer_domain='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_title='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_time='' THEN 1 ELSE 0 END)
FROM(
  -- 文字列を長さに変換する仮テーブル --
  SELECT
    *,
    CHAR_LENGTH(web_index) AS web_index_len,
    CHAR_LENGTH(web_date) AS web_date_len,
    CHAR_LENGTH(web_start_time) AS web_start_time_len,
    CHAR_LENGTH(pc_flag) AS pc_flag_len,
    CHAR_LENGTH(unknown1) AS unknown1_len,
    CHAR_LENGTH(unknown2) AS unknown2_len,
    CHAR_LENGTH(url) AS url_len,
    CHAR_LENGTH(domain) AS domain_len,
    CHAR_LENGTH(sub_domain) AS sub_domain_len,
    CHAR_LENGTH(referrer) AS referrer_len,
    CHAR_LENGTH(referrer_url) AS referrer_url_len,
    CHAR_LENGTH(referrer_domain) AS referrer_domain_len,
    CHAR_LENGTH(web_title) AS web_title_len,
    CHAR_LENGTH(web_time) AS web_time_len
  FROM
    original.t_weblog
    ) AS length_table;