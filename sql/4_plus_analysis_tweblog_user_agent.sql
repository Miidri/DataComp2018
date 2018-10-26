-- OS調査
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


      -- other -- 
      WHEN user_agent LIKE '%Android%' AND user_agent LIKE '%Windows Phone%' THEN 'windows_phone' 
      WHEN user_agent LIKE '%Mobile%' AND user_agent LIKE '%Gecko%' 
        AND user_agent LIKE '%Firefox%' AND user_agent NOT LIKE '%Android%' THEN 'firefox_os' 
      WHEN user_agent LIKE '%BB10%' AND user_agent LIKE '%Mobile%' THEN 'blackberry_10' 
      ELSE 'other'
    END AS os
  FROM
    processed.t_weblog
  ) AS t1
GROUP BY
  t1.os;

-- test: 機種 スマホ
SELECT
  user_agent
FROM 
  processed.t_weblog
WHERE
  user_agent LIKE '%Android%' AND user_agent LIKE '%KYV%' AND
  -- nexus --
  user_agent NOT LIKE '%Nexus 4%' AND -- nexus_4
  user_agent NOT LIKE '%Nexus 5%' AND -- nexus_5
  user_agent NOT LIKE '%Nexus 6%' AND -- nexus_6
  user_agent NOT LIKE '%Nexus 7%' AND -- nexus_7
  -- aquos -- 
  user_agent NOT LIKE '%304SH%' AND -- aquos_304sh
  user_agent NOT LIKE '%305SH%' AND -- aquos_305sh
  user_agent NOT LIKE '%402SH%' AND -- aquos_402sh
  user_agent NOT LIKE '%403SH%' AND -- aquos_403sh
  user_agent NOT LIKE '%404SH%' AND -- aquos_404sh
  user_agent NOT LIKE '%502SH%' AND -- aquos_502sh
  user_agent NOT LIKE '%503SH%' AND -- aquos_503sh
  user_agent NOT LIKE '%504SH%' AND -- aquos_504sh
  user_agent NOT LIKE '%505SH%' AND -- aquos_505sh
  user_agent NOT LIKE '%506SH%' AND -- aquos_506sh
  user_agent NOT LIKE '%509SH%' AND -- aquos_509sh
  user_agent NOT LIKE '%603SH%' AND -- aquos_603sh
  user_agent NOT LIKE '%604SH%' AND -- aquos_604sh
  user_agent NOT LIKE '%605SH%' AND -- aquos_605sh
  user_agent NOT LIKE '%606SH%' AND -- aquos_606sh
  user_agent NOT LIKE '%701SH%' AND -- aquos_701sh
  user_agent NOT LIKE '%IS17SH%' AND -- aquos_is17sh
  user_agent NOT LIKE '%SH-M01%' AND -- aquos_sh_m01
  user_agent NOT LIKE '%SH-M02%' AND -- aquos_sh_m02
  user_agent NOT LIKE '%SH-M03%' AND -- aquos_sh_m03
  user_agent NOT LIKE '%SH-M04%' AND -- aquos_sh_m04
  user_agent NOT LIKE '%SH-M05%' AND -- aquos_sh_m05
  user_agent NOT LIKE '%SH-L02%' AND -- aquos_sh_l02
  user_agent NOT LIKE '%SH-01F%' AND -- aquos_sh_01f
  user_agent NOT LIKE '%SH-01G%' AND -- aquos_sh_01g
  user_agent NOT LIKE '%SH-01H%' AND -- aquos_sh_01h
  user_agent NOT LIKE '%SH-01K%' AND -- aquos_sh_01k
  user_agent NOT LIKE '%SH-02E%' AND -- aquos_sh_02e
  user_agent NOT LIKE '%SH-02F%' AND -- aquos_sh_02f
  user_agent NOT LIKE '%SH-02H%' AND -- aquos_sh_02h
  user_agent NOT LIKE '%SH-02J%' AND -- aquos_sh_02j
  user_agent NOT LIKE '%SH-03G%' AND -- aquos_sh_03g
  user_agent NOT LIKE '%SH-03J%' AND -- aquos_sh_03j
  user_agent NOT LIKE '%SH-03J%' AND -- aquos_sh_03j
  user_agent NOT LIKE '%SH-04E%' AND -- aquos_sh_04e
  user_agent NOT LIKE '%SH-04F%' AND -- aquos_sh_04f
  user_agent NOT LIKE '%SH-04G%' AND -- aquos_sh_04g
  user_agent NOT LIKE '%SH-04H%' AND -- aquos_sh_04h
  user_agent NOT LIKE '%SH-05G%' AND -- aquos_sh_05g
  user_agent NOT LIKE '%SH-06E%' AND -- aquos_sh_06e
  user_agent NOT LIKE '%SH-06F%' AND -- aquos_sh_06f
  user_agent NOT LIKE '%SH-07D%' AND -- aquos_sh_07d
  user_agent NOT LIKE '%SH-08E%' AND -- aquos_sh_08e
  user_agent NOT LIKE '%SHL21%' AND -- aquos_shl21
  user_agent NOT LIKE '%SHL22%' AND -- aquos_shl22
  user_agent NOT LIKE '%SHL23%' AND -- aquos_shl23
  user_agent NOT LIKE '%SHL24%' AND -- aquos_shl24
  user_agent NOT LIKE '%SHL25%' AND -- aquos_shl25
  user_agent NOT LIKE '%SHV31%' AND -- aquos_shv31
  user_agent NOT LIKE '%SHV32%' AND -- aquos_shv32
  user_agent NOT LIKE '%SHV33%' AND -- aquos_shv33
  user_agent NOT LIKE '%SHV34%' AND -- aquos_shv34
  user_agent NOT LIKE '%SHV35%' AND -- aquos_shv35
  user_agent NOT LIKE '%SHV36%' AND -- aquos_shv36
  user_agent NOT LIKE '%SHV37%' AND -- aquos_shv37
  user_agent NOT LIKE '%SHV38%' AND -- aquos_shv38
  user_agent NOT LIKE '%SHV39%' AND -- aquos_shv39
  user_agent NOT LIKE '%SHV40%' AND -- aquos_shv40
  user_agent NOT LIKE '%SHV41%' AND -- aquos_shv41
  user_agent NOT LIKE '%SHT22%' AND -- aquos_sht22
  user_agent NOT LIKE '%SBM106SH%' AND -- aquos_106sh
  user_agent NOT LIKE '%SBM203SH%' AND -- aquos_203sh
  user_agent NOT LIKE '%SBM205SH%' AND -- aquos_205sh
  user_agent NOT LIKE '%SBM302SH%' AND -- aquos_302sh
  user_agent NOT LIKE '%SBM303SH%' AND -- aquos_303sh

  -- xperia -- 
  user_agent NOT LIKE '%501SO%' AND -- xperia_501so
  user_agent NOT LIKE '%601SO%' AND -- xperia_601so
  user_agent NOT LIKE '%602SO%' AND -- xperia_602so
  user_agent NOT LIKE '%SOL24%' AND -- xperia_sol24
  user_agent NOT LIKE '%SOL26%' AND -- xperia_sol26
  user_agent NOT LIKE '%SOV31%' AND -- xperia_sov31
  user_agent NOT LIKE '%SOV32%' AND -- xperia_sov32
  user_agent NOT LIKE '%SOV33%' AND -- xperia_sov33
  user_agent NOT LIKE '%SOV34%' AND -- xperia_sov34
  user_agent NOT LIKE '%SOV35%' AND -- xperia_sov35
  user_agent NOT LIKE '%SOV36%' AND -- xperia_sov36
  user_agent NOT LIKE '%SO-01E%' AND -- xperia_so_01e
  user_agent NOT LIKE '%SO-01F%' AND -- xperia_so_01f
  user_agent NOT LIKE '%SO-01G%' AND -- xperia_so_01g
  user_agent NOT LIKE '%SO-01H%' AND -- xperia_so_01h
  user_agent NOT LIKE '%SO-01J%' AND -- xperia_so_01j
  user_agent NOT LIKE '%SO-01K%' AND -- xperia_so_01k
  user_agent NOT LIKE '%SO-02E%' AND -- xperia_so_02e
  user_agent NOT LIKE '%SO-02G%' AND -- xperia_so_02g
  user_agent NOT LIKE '%SO-02H%' AND -- xperia_so_02h
  user_agent NOT LIKE '%SO-02J%' AND -- xperia_so_02j
  user_agent NOT LIKE '%SO-02K%' AND -- xperia_so_02k
  user_agent NOT LIKE '%SO-03D%' AND -- xperia_so_03d
  user_agent NOT LIKE '%SO-03F%' AND -- xperia_so_03f
  user_agent NOT LIKE '%SO-03G%' AND -- xperia_so_03g
  user_agent NOT LIKE '%SO-03H%' AND -- xperia_so_03h
  user_agent NOT LIKE '%SO-03J%' AND -- xperia_so_03j
  user_agent NOT LIKE '%SO-04D%' AND -- xperia_so_04d
  user_agent NOT LIKE '%SO-04E%' AND -- xperia_so_04e
  user_agent NOT LIKE '%SO-04F%' AND -- xperia_so_04f
  user_agent NOT LIKE '%SO-04G%' AND -- xperia_so_04g
  user_agent NOT LIKE '%SO-04H%' AND -- xperia_so_04h
  user_agent NOT LIKE '%SO-04J%' AND -- xperia_so_04j
  user_agent NOT LIKE '%SO-05G%' AND -- xperia_so_05g
  user_agent NOT LIKE '%SO-06D%' AND -- xperia_so_06d

  -- galaxy --
  user_agent NOT LIKE '%SCL22%' AND -- galaxy_scl22
  user_agent NOT LIKE '%SCL23%' AND -- galaxy_scl23
  user_agent NOT LIKE '%SCL24%' AND -- galaxy_scl24
  user_agent NOT LIKE '%SCV31%' AND -- galaxy_scv31
  user_agent NOT LIKE '%SCV32%' AND -- galaxy_scv32
  user_agent NOT LIKE '%SCV33%' AND -- galaxy_scv33
  user_agent NOT LIKE '%SCV34%' AND -- galaxy_scv34
  user_agent NOT LIKE '%SCV36%' AND -- galaxy_scv36
  user_agent NOT LIKE '%SCV37%' AND -- galaxy_scv37
  user_agent NOT LIKE '%SC-01D%' AND -- galaxy_sc_01d
  user_agent NOT LIKE '%SC-01E%' AND -- galaxy_sc_01e
  user_agent NOT LIKE '%SC-01F%' AND -- galaxy_sc_01f
  user_agent NOT LIKE '%SC-01G%' AND -- galaxy_sc_01g
  user_agent NOT LIKE '%SC-01K%' AND -- galaxy_sc_01k
  user_agent NOT LIKE '%SC-02E%' AND -- galaxy_sc_02e
  user_agent NOT LIKE '%SC-02F%' AND -- galaxy_sc_02f
  user_agent NOT LIKE '%SC-02G%' AND -- galaxy_sc_02g
  user_agent NOT LIKE '%SC-02H%' AND -- galaxy_sc_02h
  user_agent NOT LIKE '%SC-02J%' AND -- galaxy_sc_02j
  user_agent NOT LIKE '%SC-03D%' AND -- galaxy_sc_03d
  user_agent NOT LIKE '%SC-03E%' AND -- galaxy_sc_03e
  user_agent NOT LIKE '%SC-03G%' AND -- galaxy_sc_03g
  user_agent NOT LIKE '%SC-03J%' AND -- galaxy_sc_03j
  user_agent NOT LIKE '%SC-04E%' AND -- galaxy_sc_04e
  user_agent NOT LIKE '%SC-04F%' AND -- galaxy_sc_04f
  user_agent NOT LIKE '%SC-04G%' AND -- galaxy_sc_04g
  user_agent NOT LIKE '%SC-04J%' AND -- galaxy_sc_04j
  user_agent NOT LIKE '%SC-05D%' AND -- galaxy_sc_05d
  user_agent NOT LIKE '%SC-05G%' AND -- galaxy_sc_05g
  user_agent NOT LIKE '%SC-06D%' AND -- galaxy_sc_06d
  user_agent NOT LIKE '%403SC%' AND -- galaxy_403sc
  user_agent NOT LIKE '%ISW11SC%' AND -- galaxy_isw_11sc
  user_agent NOT LIKE '%Galaxy Nexus%' AND -- galaxy_nexus
  -- arrows --
  user_agent NOT LIKE '%M01%' AND -- arrows_m01
  user_agent NOT LIKE '%RM02%' AND -- arrows_rm02
  user_agent NOT LIKE '%FJL22%' AND -- arrows_fjl22
  user_agent NOT LIKE '%arrowsM03%' AND -- arrows_m03
  user_agent NOT LIKE '%101F%' AND -- arrows_101f
  user_agent NOT LIKE '%202F%' AND -- arrows_202f
  user_agent NOT LIKE '%301F%' AND -- arrows_301f
  user_agent NOT LIKE '%F-01D%' AND -- arrows_f_01d
  user_agent NOT LIKE '%F-01F%' AND -- arrows_f_01f
  user_agent NOT LIKE '%F-01H%' AND -- arrows_f_01h
  user_agent NOT LIKE '%F-01J%' AND -- arrows_f_01j
  user_agent NOT LIKE '%F-01K%' AND -- arrows_f_01k
  user_agent NOT LIKE '%F-02E%' AND -- arrows_f_02e
  user_agent NOT LIKE '%F-02F%' AND -- arrows_f_02f  
  user_agent NOT LIKE '%F-02G%' AND -- arrows_f_02g
  user_agent NOT LIKE '%F-02H%' AND -- arrows_f_02h
  user_agent NOT LIKE '%F-03G%' AND -- arrows_f_03g 
  user_agent NOT LIKE '%F-03H%' AND -- arrows_f_03h
  user_agent NOT LIKE '%F-04E%' AND -- arrows_f_04e
  user_agent NOT LIKE '%F-04G%' AND -- arrows_f_04g
  user_agent NOT LIKE '%F-04H%' AND -- arrows_f_04h
  user_agent NOT LIKE '%F-05D%' AND -- arrows_f_05d
  user_agent NOT LIKE '%F-05E%' AND -- arrows_f_05e
  user_agent NOT LIKE '%F-05F%' AND -- arrows_f_05f
  user_agent NOT LIKE '%F-05J%' AND -- arrows_f_05j
  user_agent NOT LIKE '%F-06E%' AND -- arrows_f_06e
  user_agent NOT LIKE '%F-10D%' AND -- arrows_f_10d

  -- disney --
  user_agent NOT LIKE '%SH-02G%' AND -- disney_mobile_sh_02g
  user_agent NOT LIKE '%SH-04F%' AND -- disney_mobile_sh_04f
  user_agent NOT LIKE '%SH-05F%' AND -- disney_mobile_sh_05f
  user_agent NOT LIKE '%N-03E%' AND -- disney_mobile_n_03e
  user_agent NOT LIKE '%F-03F%' AND -- disney_mobile_f_03f
  user_agent NOT LIKE '%DM-01G%' AND -- disney_mobile_dm_01g
  user_agent NOT LIKE '%DM-01H%' AND -- disney_mobile_dm_01h
  user_agent NOT LIKE '%DM-01J%' AND -- disney_mobile_dm_01j
  -- samsung --
  user_agent NOT LIKE '%SM-T800%' AND -- samsung_sm_t800
  user_agent NOT LIKE '%SM-G5308W%' AND -- samsung_sm_g5308w
  user_agent NOT LIKE '%SM-N9108V%' AND -- samsung_sm_n9108v
  user_agent NOT LIKE '%SM-G7108V%' AND -- samsung_sm_g7108v
  user_agent NOT LIKE '%SM-G900P%' AND -- samsung_sm_g900p
  user_agent NOT LIKE '%SM-G920F%' AND -- samsung_sm_g920f
  user_agent NOT LIKE '%SM-G935P%' AND -- samsung_sm_g935p
  user_agent NOT LIKE '%SCH-I535%' AND -- samsung_sch_i535
  -- digno -- 
  user_agent NOT LIKE '%WX10K%' AND -- digno_wk10k
  user_agent NOT LIKE '%KYL22%' AND -- digno_kyl22
  user_agent NOT LIKE '%KYL21%' AND -- digno_kyl21
  user_agent NOT LIKE '%302KC%' AND -- digno_302kc
  user_agent NOT LIKE '%503KC%' AND -- digno_503kc
  -- medias -- 
  user_agent NOT LIKE '%N-04D%' AND -- medias_n_04d
  user_agent NOT LIKE '%N-05D%' AND -- medias_n_05d
  user_agent NOT LIKE '%N-06D%' AND -- medias_n_06d
  user_agent NOT LIKE '%N-06E%' AND -- medias_n_06e
  user_agent NOT LIKE '%N-08D%' AND -- medias_n_08d

  -- optimus --
  user_agent NOT LIKE '%L-02E%' AND -- optimus_l_02e
  user_agent NOT LIKE '%L-04E%' AND -- optimus_l_04e
  user_agent NOT LIKE '%L-05D%' AND -- optimus_l_05d
  -- eluga --
  user_agent NOT LIKE '%P-06D%' AND -- eluga_p_06d
  user_agent NOT LIKE '%P-07D%' AND -- eluga_p_07d
  -- htl --  
  user_agent NOT LIKE '%HTL21%' AND -- j_htl21
  user_agent NOT LIKE '%HTL22%' AND -- j_htl22
  -- kindle fire --
  user_agent NOT LIKE '%KFGIWI%' AND -- kindle_fire_kfgiwi
  user_agent NOT LIKE '%KFTT%' AND -- kindle_fire_kftt
  -- huawei -- 
  user_agent NOT LIKE '%HUAWEI VNS-L22%' AND -- huawei_vns_l22
  user_agent NOT LIKE '%HUAWEI VNS-L52%' AND -- huawei_vns_l52
  user_agent NOT LIKE '%HUAWEI SCL-L02%' AND -- huawei_scl_l02
  user_agent NOT LIKE '%HUAWEI P7-L10%' AND -- huawei_p7_l10
  user_agent NOT LIKE '%HUAWEI CAN-L12%' AND -- huawei_can_l12
  user_agent NOT LIKE '%HUAWEI KII-L22%' AND -- huawei_kii_l22
  user_agent NOT LIKE '%HUAWEI MT7-J1%' AND -- huawei_mt7_j1
  user_agent NOT LIKE '%HUAWEI P8max%' AND -- huawei_p8max
  user_agent NOT LIKE '%HUAWEI G6-L22%' AND -- huawei_g6_l22
  user_agent NOT LIKE '%HUAWEI M2-802L%' AND -- huawei_m2_802l
  user_agent NOT LIKE '%HUAWEI608HW%' AND -- huawei_608hw
  user_agent NOT LIKE '%ALE-L02%' AND -- huawei_ale_l02
  user_agent NOT LIKE '%G620S-L02%' AND -- huawei_g620s_l02
  user_agent NOT LIKE '%PLE-701L%' AND -- huawei_ple_701l
  user_agent NOT LIKE '%FRD-L02%' AND -- huawei_frd_l02
  user_agent NOT LIKE '%MHA-L29%' AND -- huawei_mha_l29
  user_agent NOT LIKE '%HDN-W09%' AND -- huawei_hdn_w09
  user_agent NOT LIKE '%PRA-LX2%' AND -- huawei_pra_lx2
  user_agent NOT LIKE '%VKY-L29%' AND -- huawei_vky_l29
  user_agent NOT LIKE '%FIG-LA1%' AND -- huawei_fig_la1
  user_agent NOT LIKE '%BAH-W09%' AND -- huawei_bah_w09
  user_agent NOT LIKE '%EVA-L09%' AND -- huawei_eva_l09
  -- media_pad --
  user_agent NOT LIKE '%403HW%' AND -- mediapad_403hs
  user_agent NOT LIKE '%BTV-W09%' AND -- mediapad_btv_w09
  user_agent NOT LIKE '%KOB-W09%' AND -- mediapad_kob_w09
  user_agent NOT LIKE '%BTV-DL09%' AND -- mediapad_btv_dl09
  user_agent NOT LIKE '%CPN-W09%' AND -- mediapad_cpn_w09
  user_agent NOT LIKE '%JDN-L01%' AND -- mediapad_jdn_l01
  user_agent NOT LIKE '%JDN-W09%' AND -- mediapad_jdm_w09
  -- asus -- 
  user_agent NOT LIKE '%K00G%' AND -- asus_k00g
  user_agent NOT LIKE '%P002%' AND -- asus_p002
  user_agent NOT LIKE '%P024%' AND -- asus_p024
  user_agent NOT LIKE '%P01T_1%' AND -- asus_p01t_1
  user_agent NOT LIKE '%AST21%' AND -- asus_ast21
  user_agent NOT LIKE '%ASUS_Z017DA%' AND -- asus_z017da
  user_agent NOT LIKE '%ASUS_T00P%' AND -- asus_t00p
  user_agent NOT LIKE '%ASUS_Z00AD%' AND -- asus_z00ad
  user_agent NOT LIKE '%ASUS_Z00ED%' AND -- asus_z00ed
  user_agent NOT LIKE '%ASUS_X013DB%' AND -- asus_x013db
  user_agent NOT LIKE '%ASUS_X00DDA%' AND -- asus_x00dda
  user_agent NOT LIKE '%ASUS_X008DB%' AND -- asus_x008db
  user_agent NOT LIKE '%ASUS_Z01BDA%' AND -- asus_z01bda
  user_agent NOT LIKE '%ASUS_Z010DB%' AND -- asus_z010db
  user_agent NOT LIKE '%ASUS_Z01KDA%' AND -- asus_z01kda
  user_agent NOT LIKE '%ASUS_X00HD%' AND -- asus_x00hd
  user_agent NOT LIKE '%ASUS_Z00UD%' AND -- asus_z00ud
  user_agent NOT LIKE '%ASUS_A007%' AND -- asus_a007
  user_agent NOT LIKE '%ASUS_Z012DA%' AND -- asus_z012da
  user_agent NOT LIKE '%ASUS_Z01FD%' AND -- asus_z10fd
  user_agent NOT LIKE '%ASUS_A002%' AND -- asus_a002
  user_agent NOT LIKE '%ASUS_P00I%' AND -- asus_p00i
  -- sharp --
  user_agent NOT LIKE '%X1%' AND -- sharp_x1
  user_agent NOT LIKE '%S1%' AND -- sharp_s1
  user_agent NOT LIKE '%507SH%' AND -- sharp_507sh
  user_agent NOT LIKE '%S3-SH%' AND -- sharp_s3_sh
  -- dtab -- 
  user_agent NOT LIKE '%d-01G%' AND -- dtab_d_01g
  user_agent NOT LIKE '%d-01J%' AND -- dtab_d_01j
  user_agent NOT LIKE '%d-01H%' AND -- dtab_d_01h
  user_agent NOT LIKE '%d-02H%' AND -- dtab_d_02h

  -- vaio --
  user_agent NOT LIKE '%VPA051%' AND -- vaio_vpa051
  -- urbano --
  user_agent NOT LIKE '%KYV31%' AND -- urbano_kyv31
  user_agent NOT LIKE '%KYV32%' AND -- urbano_kyv32
  user_agent NOT LIKE '%KYV33%' AND -- urbano_kyv33
  user_agent NOT LIKE '%KYV34%' AND -- urbano_kyv34
  user_agent NOT LIKE '%KYV40U%' AND -- urbano_kyv40u
  user_agent NOT LIKE '%KYV42%' AND -- urbano_kyv42
  user_agent NOT LIKE '%KYY22%' AND -- urbano_kyy22
  user_agent NOT LIKE '%KYY23%' AND -- urbano_kyy23
  user_agent NOT LIKE '%KYY24%' AND -- urbano_kyy24
  -- kyosera -- 
  user_agent NOT LIKE '%KYV35%' AND -- kyosera_kyv35
  user_agent NOT LIKE '%KYV36%' AND -- kyosera_kyv36
  user_agent NOT LIKE '%KYV37%' AND -- kyosera_kyv37
  user_agent NOT LIKE '%KC-S301AE%' AND -- kyosera_kc_s301ae

  -- LG --
  user_agent NOT LIKE '%LG-V480%' AND -- lg_v480
  user_agent NOT LIKE '%LG-D620%' AND -- lg_d620
  user_agent NOT LIKE '%LGS01%' AND -- lg_so1
  user_agent NOT LIKE '%LGS02%' AND -- lg_so2
  user_agent NOT LIKE '%L-02D%' AND -- lg_02d
  user_agent NOT LIKE '%L-01F%' AND -- lg_01f
  user_agent NOT LIKE '%LGL22%' AND -- lg_lgl22
  user_agent NOT LIKE '%LGL24%' AND -- lg_lgl24
  user_agent NOT LIKE '%LGT01%' AND -- lg_lgt01
  user_agent NOT LIKE '%LGT02%' AND -- lg_lgt02
  user_agent NOT LIKE '%LGT31%' AND -- lg_lgt31
  user_agent NOT LIKE '%LGT32%' AND -- lg_lgt32
  user_agent NOT LIKE '%LGV31%' AND -- lg_lgv31
  user_agent NOT LIKE '%LGV32%' AND -- lg_lgv32
  user_agent NOT LIKE '%LGV33%' AND -- lg_lgv33
  user_agent NOT LIKE '%LGV34%' AND -- lg_lgv34
  user_agent NOT LIKE '%LGV35%' AND -- lg_lgv35
  -- lenovo --
  user_agent NOT LIKE '%lenovo%' AND -- lenovo
  user_agent NOT LIKE '%601LV%' AND -- lenovo_601lv
  user_agent NOT LIKE '%602LV%' AND -- lenovo_602lv
  --------
  user_agent NOT LIKE '%ISW12HT%' AND -- htc_isw12ht
  user_agent NOT LIKE '%R7005%' AND -- oppo_r3_r7005
  user_agent NOT LIKE '%PLUS%' AND -- plus
  user_agent NOT LIKE '%CP-B43%' AND -- covia_cp_b_43
  user_agent NOT LIKE '%SKT01%' AND -- torque_skt_01
  user_agent NOT LIKE '%PC-TS708T1W%' AND -- nec_ts_708t1
  user_agent NOT LIKE '%FTJ161B%' AND -- freetel_rei
  user_agent NOT LIKE '%WAS-LX2J%' AND -- p_10_lite
  user_agent NOT LIKE '%Redmi 4X%' AND -- xiaomi_redmi_4x
  user_agent NOT LIKE '%Moto G%' AND -- moto_g5
  user_agent NOT LIKE '%LaVieTab PC-TE508S1%' AND -- lavie_pc_te508s1
  user_agent NOT LIKE '%201M%' -- motorola_201m
GROUP BY
  user_agent
ORDER BY 
  COUNT(user_agent) DESC;