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

## Directory

```
├── DataComp2018.Rproj
├── README.md
├── Rmd
│   ├── 0_EDA_check_house_number.Rmd
│   ├── 0_EDA_t_weblog.Rmd
│   └── 1_Analysis_t_weblog.Rmd
├── script
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
