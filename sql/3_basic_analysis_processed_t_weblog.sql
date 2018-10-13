-- basic analysis for raw data -- 
SELECT
  -- MAX --
  MAX(house_num),
  MAX(web_date),
  MAX(web_start_datetime),
  MAX(pc_flag),
  MAX(sp_flag),
  MAX(tb_flag),
  MAX(url_len),
  MAX(domain_len),
  MAX(sub_domain_len),
  MAX(user_agent_len),
  MAX(referrer_len),
  MAX(referrer_domain_len),
  MAX(web_title_len),
  MAX(web_time),
  -- MIN --
  MIN(house_num),
  MIN(web_date),
  MIN(web_start_datetime),
  MIN(pc_flag),
  MIN(sp_flag),
  MIN(tb_flag),
  MIN(url_len),
  MIN(domain_len),
  MIN(sub_domain_len),
  MIN(referrer_len),
  MIN(referrer_len),
  MIN(referrer_domain_len),
  MIN(web_title_len),
  MIN(web_time),
  -- COUNT DISTINCT -- 
  COUNT(DISTINCT(house_num)),
  COUNT(DISTINCT(web_date)),
  COUNT(DISTINCT(web_start_datetime)),
  COUNT(DISTINCT(pc_flag)),
  COUNT(DISTINCT(sp_flag)),
  COUNT(DISTINCT(tb_flag)),
  COUNT(DISTINCT(url)),
  COUNT(DISTINCT(domain)),
  COUNT(DISTINCT(sub_domain)),
  COUNT(DISTINCT(user_agent)),
  COUNT(DISTINCT(referrer)),
  COUNT(DISTINCT(referrer_domain)),
  COUNT(DISTINCT(web_title)),
  COUNT(DISTINCT(web_time)),
  -- CHECK NULL --
  SUM(CASE WHEN house_num IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_date IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_start_datetime IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN pc_flag IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN sp_flag IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN tb_flag IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN url IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN domain IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN sub_domain IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN user_agent IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer_domain IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_title IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_time IS NULL THEN 1 ELSE 0 END),
  SUM(CASE WHEN url='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN domain='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN sub_domain='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN user_agent='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN referrer_domain='' THEN 1 ELSE 0 END),
  SUM(CASE WHEN web_title='' THEN 1 ELSE 0 END)
FROM(
  -- 文字列を長さに変換する仮テーブル --
  SELECT
    *,
    CHAR_LENGTH(url) AS url_len,
    CHAR_LENGTH(domain) AS domain_len,
    CHAR_LENGTH(sub_domain) AS sub_domain_len,
    CHAR_LENGTH(user_agent) AS user_agent_len,
    CHAR_LENGTH(referrer) AS referrer_len,
    CHAR_LENGTH(referrer_domain) AS referrer_domain_len,
    CHAR_LENGTH(web_title) AS web_title_len
  FROM
    processed.t_weblog
    ) AS length_table;