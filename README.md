# テーブル設計

## user テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile          | string | null: false |

## creators テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| c_name             | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | string | null: false |

## songs テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title   | string | null: false |
| song_data   | string | null: false |
| title   | string | null: false |
| user   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |
| song   | references | null: false, foreign_key: true |

## dls テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| song   | references | null: false, foreign_key: true |

## subscribes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| plan   | references | null: false, foreign_key: true |
