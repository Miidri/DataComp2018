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
      WHEN user_agent LIKE '%Windows NT 5.2%' THEN 'windows_xp.64'
      WHEN user_agent LIKE '%Windows NT 6.0%' THEN 'windows_vista'
      WHEN user_agent LIKE '%Windows NT 6.1%' THEN 'windows_7'
      WHEN user_agent LIKE '%Windows NT 6.2%' THEN 'windows_8'
      WHEN user_agent LIKE '%Windows NT 6.3%' THEN 'windows_8_1'
      WHEN user_agent LIKE '%Windows NT 10.0%' THEN 'windows_10'
      WHEN user_agent LIKE '%Windows%' THEN 'windows' -- 2つ変なのがある
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
      WHEN user_agent LIKE '%Android%' AND user_agent LIKE '%Mobile%' THEN 'android'  -- スマホ?
      WHEN user_agent LIKE '%Android%' THEN 'android' -- タブレット?
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
  
-- 調査
SELECT
  user_agent
FROM
  (
  SELECT
    CASE
      -- NULL --
      WHEN user_agent='' THEN ''
      -- windows --
      WHEN user_agent LIKE '%Windows NT 5.0%' THEN 'windows_2000'
      WHEN user_agent LIKE '%Windows NT 5.1%' THEN 'windows_xp'
      WHEN user_agent LIKE '%Windows NT 5.2%' THEN 'windows_xp.64'
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
      WHEN user_agent LIKE '%Android%' AND user_agent LIKE '%Mobile%' THEN 'android'  -- スマホ?
      WHEN user_agent LIKE '%Android%' THEN 'android_tablet' -- タブレット?
      WHEN user_agent LIKE '%Android%' AND user_agent LIKE '%Windows Phone%' THEN 'windows_phone' 
      WHEN user_agent LIKE '%Mobile%' AND user_agent LIKE '%Gecko%' 
        AND user_agent LIKE '%Firefox%' AND user_agent NOT LIKE '%Android%' THEN 'firefox_os' 
      WHEN user_agent LIKE '%BB10%' AND user_agent LIKE '%Mobile%' THEN 'android' 
      ELSE 'other'
    END AS os,
    user_agent
  FROM
    processed.t_weblog
  ) AS t1
WHERE
  t1.os = 'other';

-- test: 機種
SELECT
  user_agent,
  COUNT(user_agent)
FROM 
  processed.t_weblog
WHERE
  user_agent LIKE '%Android%' AND user_agent LIKE'%Mobile%' AND
  user_agent NOT LIKE '%Nexus 4%' AND -- nexus_4
  user_agent NOT LIKE '%Nexus 5%' AND -- nexus_5
  user_agent NOT LIKE '%Nexus 6%' AND -- nexus_6
  user_agent NOT LIKE '%SHV31%' AND -- aquos_serie_mini_shb_31
  user_agent NOT LIKE '%402SH%' AND-- aquos_crystal_x
  user_agent NOT LIKE '%SH-01G%' AND -- aquos_zeta_sh_01_g
  user_agent NOT LIKE '%SH-01F%' AND -- aquos_zeta_sh_01_f
  user_agent NOT LIKE '%SH-04E%' AND -- aquos_ex_sh_04_e
  user_agent NOT LIKE '%SO-03D%' AND -- xperia_so_03_d
  user_agent NOT LIKE '%SO-04D%' AND -- xperia_so_04_d
  user_agent NOT LIKE '%SO-06D%' AND -- xperia_so_06_d

  user_agent NOT LIKE '%SC-02E%' AND -- galaxy_note_sc_02_e
  user_agent NOT LIKE '%SC-03D%' AND -- galaxy_s_2_lte_sc_03_d
  user_agent NOT LIKE '%SHL22%' AND -- aquos_serie_shl_22
  user_agent NOT LIKE '%SHL21%' AND -- aquos_serie_shl_21
  user_agent NOT LIKE '%F-06E%' AND -- arrows_nx_f_06_e
  user_agent NOT LIKE '%SH-02G%' AND -- disney_mobile_sh_02_g
  user_agent NOT LIKE '%SH-05F%' AND -- disney_mobile_sh_05_f
  user_agent NOT LIKE '%N-03E%' AND -- disney_mobile_n_03_e
  user_agent NOT LIKE '%F-03F%' AND -- disney_mobile_f_03_f

  user_agent NOT LIKE '%KYY22%' AND -- urbano_l_02
  user_agent NOT LIKE '%301F%' AND -- arrows_a_301f
  user_agent NOT LIKE '%Galaxy Nexus%' AND -- galaxy_nexus
  user_agent NOT LIKE '%HTL22%' AND -- j_one_htl_22
  user_agent NOT LIKE '%SBM203SH%' AND -- aquos_xx_203_sh
  user_agent NOT LIKE '%F-10D%' AND -- arrows_x_f_10_d
  user_agent NOT LIKE '%SBM203SH%' AND -- aquos_xx_203_sh
  user_agent NOT LIKE '%SBM302SH%' AND -- aquos_xx_302_sh
  user_agent NOT LIKE '%SBM303SH%' AND -- aquos_xx_mini_303_sh

  user_agent NOT LIKE '%F-05D%' AND -- arrows_x_lte_f_05_d
  user_agent NOT LIKE '%lenovo%' AND -- lenovo
  user_agent NOT LIKE '%SM-G900P%' AND -- samsung_sm_g_900_p
  user_agent NOT LIKE '%SM-G920F%' AND -- samsung_sm_g_920_f
  user_agent NOT LIKE '%SH-07D%' AND -- aquos_sh_07_d
  user_agent NOT LIKE '%304SH%' AND -- aquos_xx_304_sh
  user_agent NOT LIKE '%305SH%' AND -- aquos_crystal_305_sh
  user_agent NOT LIKE '%R7005%' AND -- other
  user_agent NOT LIKE '%N-06E%' AND -- medias_x_n_06_e
  user_agent NOT LIKE '%N-04D%' AND -- medias_lte_n_04_d

  user_agent NOT LIKE '%L-02D%' AND -- prada_lg_l_02_d
  user_agent NOT LIKE '%FJL22%' AND -- arrows_z_fjl_22
  user_agent NOT LIKE '%K00G%' AND -- other
  user_agent NOT LIKE '%SH-M01%' AND -- other
  user_agent NOT LIKE '%KYL22%' AND -- digno_m_kyl_22
  user_agent NOT LIKE '%PLUS%' -- other
GROUP BY
  user_agent;

-- test:キャリアできない
SELECT
  career
FROM(
  SELECT
    CASE 
      WHEN user_agent LIKE '%DoCoMo%' THEN 'docomo'
      WHEN user_agent LIKE '%UP.Browser%' THEN 'au'
      WHEN user_agent LIKE '%J-PHONE%' THEN 'softbank'
      ELSE 'other'
    END AS career
  FROM
    processed.t_weblog
    ) AS t1
GROUP BY 
  career;