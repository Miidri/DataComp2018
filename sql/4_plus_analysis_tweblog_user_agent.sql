-- OS調査
-- スマホは含まれない!

SELECT
  t1.os,
  COUNT(t1.os)
FROM
  (
  SELECT
    CASE
      -- NULL --
      WHEN user_agent='' THEN ''
      -- windows --
      WHEN user_agent LIKE '%Windows NT 5.0%' THEN 'windows_2000'
      WHEN user_agent LIKE '%Windows NT 5.1%' THEN 'windows_xp'
      WHEN user_agent LIKE '%Windows NT 5.2%' THEN 'windows_xp_64'
      WHEN user_agent LIKE '%Windows NT 6.0%' THEN 'windows_vista'
      WHEN user_agent LIKE '%Windows NT 6.1%' THEN 'windows_7'
      WHEN user_agent LIKE '%Windows NT 6.2%' THEN 'windows_8'
      WHEN user_agent LIKE '%Windows NT 6.3%' THEN 'windows_8_1'
      WHEN user_agent LIKE '%Windows NT 10.0%' THEN 'windows_10'
      WHEN user_agent LIKE '%Windows%' THEN 'windows' -- 2つへんなのがある
      -- mac --
      WHEN user_agent LIKE '%Mac OS X 10_5%' OR user_agent LIKE '%Mac OS X 10.5%' THEN 'mac_10_5'
      WHEN user_agent LIKE '%Mac OS X 10_6%' OR user_agent LIKE '%Mac OS X 10.6%' THEN 'mac_10_6'
      WHEN user_agent LIKE '%Mac OS X 10_7%' OR user_agent LIKE '%Mac OS X 10.7%' THEN 'mac_10_7'
      WHEN user_agent LIKE '%Mac OS X 10_8%' OR user_agent LIKE '%Mac OS X 10.8%' THEN 'mac_10_8'
      WHEN user_agent LIKE '%Mac OS X 10_9%' OR user_agent LIKE '%Mac OS X 10.9%' THEN 'mac_10_9'
      WHEN user_agent LIKE '%Mac OS X 10_10%' OR user_agent LIKE '%Mac OS X 10.10%' THEN 'mac_10_10'
      WHEN user_agent LIKE '%Mac OS X 10_11%' OR user_agent LIKE '%Mac OS X 10.11%' THEN 'mac_10_11'
      WHEN user_agent LIKE '%Mac OS X 10_12%' OR user_agent LIKE '%Mac OS X 10.12%' THEN 'mac_10_12'
      WHEN user_agent LIKE '%Mac OS X 10_13%' OR user_agent LIKE '%Mac OS X 10.13%' THEN 'mac_10_13'
      -- linux --
      WHEN user_agent LIKE '%Linux x86_64%' AND user_agent NOT LIKE '%Android%' THEN 'linux_64'
      WHEN user_agent LIKE '%Linux i686%' AND user_agent NOT LIKE '%Android%' THEN 'linux_32'
      WHEN user_agent LIKE '%CrOS%' THEN 'chrome'
      -- game --
      WHEN user_agent LIKE '%Nintendo WiiU%' THEN 'wii'
      WHEN user_agent LIKE '%PlayStation 4 1.52%' THEN 'playstation_4'
      WHEN user_agent LIKE '%PlayStation Vita 1.50%' THEN 'ps_vita'
      WHEN user_agent LIKE '%Nintendo Switch%' THEN 'switch'
      WHEN user_agent LIKE '%New Nintendo 3DS%' THEN '3ds'
      -- iphone --
      WHEN user_agent LIKE '%iPhone OS 11_3%' THEN 'iphone_11_3' 
      WHEN user_agent LIKE '%iPhone OS 11_2%' THEN 'iphone_11_2'
      WHEN user_agent LIKE '%iPhone OS 11_1%' THEN 'iphone_11_1'
      WHEN user_agent LIKE '%iPhone OS 11_0%' THEN 'iphone_11_0'
      WHEN user_agent LIKE '%iPhone OS 10_3%' THEN 'iphone_10_3'
      WHEN user_agent LIKE '%iPhone OS 10_2%' THEN 'iphone_10_2'
      WHEN user_agent LIKE '%iPhone OS 10_1%' THEN 'iphone_10_1'
      WHEN user_agent LIKE '%iPhone OS 10_0%' THEN 'iphone_10_0'
      WHEN user_agent LIKE '%iPhone OS 9_3%' THEN 'iphone_9_3'
      WHEN user_agent LIKE '%iPhone OS 9_2%' THEN 'iphone_9_2'     
      WHEN user_agent LIKE '%iPhone OS 9_1%' THEN 'iphone_9_1'      
      WHEN user_agent LIKE '%iPhone OS 9_0%' THEN 'iphone_9_0'
      WHEN user_agent LIKE '%iPhone OS 8_4%' THEN 'iphone_8_4'
      WHEN user_agent LIKE '%iPhone OS 8_3%' THEN 'iphone_8_3'     
      WHEN user_agent LIKE '%iPhone OS 8_2%' THEN 'iphone_8_2'      
      WHEN user_agent LIKE '%iPhone OS 8_1%' THEN 'iphone_8_1'
      WHEN user_agent LIKE '%iPhone OS 8_0%' THEN 'iphone_8_0'
      WHEN user_agent LIKE '%iPhone OS 7_1%' THEN 'iphone_7_1'     
      WHEN user_agent LIKE '%iPhone OS 7_0%' THEN 'iphone_7_0' 
      WHEN user_agent LIKE '%iPhone OS 6_1%' THEN 'iphone_6_1'      
      WHEN user_agent LIKE '%iPhone OS 6_0%' THEN 'iphone_6_0'
      WHEN user_agent LIKE '%iPhone OS 5_1%' THEN 'iphone_5_1'
      WHEN user_agent LIKE '%iPhone OS 4_3%' THEN 'iphone_4_3'     
      WHEN user_agent LIKE '%iPhone OS 4_0%' THEN 'iphone_4_0' 
      WHEN user_agent LIKE '%iPhone OS 3_1%' THEN 'iphone_3_1' 
      WHEN user_agent LIKE '%iPhone OS 3_0%' THEN 'iphone_3_0' 
      WHEN user_agent LIKE '%iPhone%' THEN 'iphone' -- 6つ変なのがある.
      -- ipad--
      WHEN user_agent LIKE '%iPad; CPU OS 11_3%' THEN 'ipad_11_3' 
      WHEN user_agent LIKE '%iPad; CPU OS 11_2%' THEN 'ipad_11_2'
      WHEN user_agent LIKE '%iPad; CPU OS 11_1%' THEN 'ipad_11_1'
      WHEN user_agent LIKE '%iPad; CPU OS 11_0%' THEN 'ipad_11_0'
      WHEN user_agent LIKE '%iPad; CPU OS 10_3%' THEN 'ipad_10_3'
      WHEN user_agent LIKE '%iPad; CPU OS 10_2%' THEN 'ipad_10_2'
      WHEN user_agent LIKE '%iPad; CPU OS 10_1%' THEN 'ipad_10_1'
      WHEN user_agent LIKE '%iPad; CPU OS 10_0%' THEN 'ipad_10_0'
      WHEN user_agent LIKE '%iPad; CPU OS 9_3%' THEN 'ipad_9_3'
      WHEN user_agent LIKE '%iPad; CPU OS 9_2%' THEN 'ipad_9_2'     
      WHEN user_agent LIKE '%iPad; CPU OS 9_1%' THEN 'ipad_9_1'      
      WHEN user_agent LIKE '%iPad; CPU OS 9_0%' THEN 'ipad_9_0'
      WHEN user_agent LIKE '%iPad; CPU OS 8_4%' THEN 'ipad_8_4'
      WHEN user_agent LIKE '%iPad; CPU OS 8_3%' THEN 'ipad_8_3'     
      WHEN user_agent LIKE '%iPad; CPU OS 8_2%' THEN 'ipad_8_2'      
      WHEN user_agent LIKE '%iPad; CPU OS 8_1%' THEN 'ipad_8_1'
      WHEN user_agent LIKE '%iPad; CPU OS 8_0%' THEN 'ipad_8_0'
      WHEN user_agent LIKE '%iPad; CPU OS 7_1%' THEN 'ipad_7_1'     
      WHEN user_agent LIKE '%iPad; CPU OS 7_0%' THEN 'ipad_7_0' 
      WHEN user_agent LIKE '%iPad; CPU OS 6_1%' THEN 'ipad_6_1'      
      WHEN user_agent LIKE '%iPad; CPU OS 6_0%' THEN 'ipad_6_0'
      WHEN user_agent LIKE '%iPad; CPU OS 5_1%' THEN 'ipad_5_1'
      WHEN user_agent LIKE '%iPad; CPU OS 4_3%' THEN 'ipad_4_3'     
      WHEN user_agent LIKE '%iPad; CPU OS 4_0%' THEN 'ipad_4_0' 
      WHEN user_agent LIKE '%iPad; CPU OS 3_1%' THEN 'ipad_3_1' 
      WHEN user_agent LIKE '%iPad; CPU OS 3_0%' THEN 'ipad_3_0' 
      WHEN user_agent LIKE '%iPad%' THEN 'ipad' -- 2つ変なのがある.
      -- android --
      WHEN user_agent LIKE '%Android%' AND user_agent LIKE '%Mobile%' THEN 'android' 
      WHEN user_agent LIKE '%Android%' AND user_agent LIKE '%Windows Phone%' THEN 'windows_phone' 
      WHEN user_agent LIKE '%Mobile%' AND user_agent LIKE '%Gecko%' 
        AND user_agent LIKE '%Firefox%' AND user_agent NOT LIKE '%Android%' THEN 'firefox_os' 
      WHEN user_agent LIKE '%BB10%' AND user_agent LIKE '%Mobile%' THEN 'android' 
      ELSE 'other'
    END AS os
  FROM
    processed.t_weblog
  ) AS t1
GROUP BY
  t1.os;

-- test
SELECT
  user_agent
FROM 
  processed.t_weblog
WHERE
  user_agent LIKE '%Android%'
LIMIT 1000;
