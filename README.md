# DataComp2018
data competition 2018

## SQL

For the working process

- 0 : insert data
- 1 : basic analysis for original data
- 1_1 : check primary key
- 2 : preprocess
- 3 : basic analysis for prerprocess data
- 4 : plus analysis for preprocess data

## Rmd

- 0 : EDA for each

## script
 
- sql_connect.R : SQL接続情報, no push
- function.R: 各種関数
## data

- watch_rate.csv: リアルタイム視聴率, タイムシフト視聴率, 総合視聴率を算出　
- watch_rate_pre.csv: 過去4週間の視聴率の平均値を該当する番組の推定視聴率とする
- 接触ログと再生ログのイメージ.xlsx: 接触ログ, 再生ログの概略図

## Directory

```
├── DataComp2018.Rproj
├── README.md
├── Rmd
│   ├── 0_EDA_check_house_number.Rmd
│   ├── 0_EDA_check_house_number.html
│   ├── 0_EDA_t_weblog.Rmd
│   ├── 0_EDA_t_weblog.html
│   ├── 0_EDA_t_weblog_about_unique.Rmd
│   ├── 0_EDA_t_weblog_about_unique.html
│   ├── 0_EDA_tv.Rmd
│   ├── 0_EDA_tv.html
│   └── 1_Analysis_slide.Rmd
├── data
│   ├── watch_rate.csv
│   ├── watch_rate_pre.csv
│   └── 接触ログと再生ログのイメージ.xlsx
├── script
│   ├── function.R
│   └── sql_connect.R
└── sql
    ├── 0_insert_profiledata.sql
    ├── 0_insert_profilemaster.sql
    ├── 0_insert_weblog.sql
    ├── 1-1_check_primary_key_profiledata.sql
    ├── 1-1_check_primary_key_profilemaster.sql
    ├── 1-1_check_primary_key_t_weblog.sql
    ├── 1_basic_analysis_original_profiledeta.sql
    ├── 1_basic_analysis_original_profilemaster.sql
    ├── 1_basic_analysis_original_t_weblog.sql
    ├── 2_preprocess_profiledata.sql
    ├── 2_preprocess_profilemaster.sql
    ├── 2_preprocess_t_weblog.sql
    ├── 3-1_check_house_num_unique.sql
    ├── 3_basic_analysis_processed_profiledeta.sql
    ├── 3_basic_analysis_processed_profilemaster.sql
    ├── 3_basic_analysis_processed_t_weblog.sql
    ├── 4_plus_analysis_tweblog_url.sql
    └── 4_plus_analysis_tweblog_user_agent.sql
```
