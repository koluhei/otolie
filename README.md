![otolie](https://user-images.githubusercontent.com/86698464/129831593-0872e499-093a-45c0-94c5-ea92da1e6332.png)
<h1 align="center">otolie</h1>

# アプリの概要
　近年、動画制作が身近になったことや配信業の発達などによって、音楽の需要が高まり続けています。また、DTMソフトの普及により個人での音楽制作も増え続けています。<br>
　『otolie』はそうした需要に応えるための、音楽販売サービスです。
このアプリでは「ユーザー」と「クリエイター」に様々なサービスを提供します。

## URL 
http://18.177.32.82/

### テスト用アカウント
<b>ユーザー</b>  
メールアドレス：shiba@test.com  
パスワード：shiba1

<b>クリエイター</b>  
メールアドレス：pag@test.com  
パスワード：pagpag1


# アプリの機能

## 「ユーザー」にできること
・<b>音楽の検索</b>  
<img src="https://user-images.githubusercontent.com/86698464/129841326-1d750472-ca55-45d0-a42b-0a3155abd6c7.png" width=50%>  
　ジャンルやキーワードであなたの要望にマッチした音楽を探すことができます。 

・<b>クリエイターの検索</b>  
<img src="https://user-images.githubusercontent.com/86698464/129841679-c43140ae-9de1-46d7-b48f-3e6085278a33.png" width=50%>   
　クリエイター名やプロフィールからお気に入りのクリエイターを見つけ出すことができます。

・<b>有料音楽の視聴、購入</b>  
<img src="https://user-images.githubusercontent.com/86698464/129833670-292e05d3-dd9e-496e-84a1-65a322c9129a.png" width=50%>   
　カード情報を入力し購入することで、音源データをダウンロードできるようになります。  

・<b>クリエイターへの作曲依頼</b>  
<img src="https://user-images.githubusercontent.com/86698464/129834225-0d349256-8d9f-436a-a29b-f61182361bee.png" width=50%>   
　作曲依頼を購入すると、使用用途や要望が自動でクリエイターのメッセージに送信されます。(下記画像参照)  

・<b>クリエイターとのコミュニケーション</b>  
<img src="https://user-images.githubusercontent.com/86698464/129840371-ab153556-71e0-41fa-9ce7-1a0c86c15134.png" width=50%>  
クリエイターの詳細ページのメールアイコンをクリックすることで、ダイレクトメッセージを送ることができます。

## 「クリエイター」にできること
・<b>オリジナル楽曲の販売</b>  
<img src="https://user-images.githubusercontent.com/86698464/129843328-e67924cc-956a-47f7-860b-2a2a9d7cbb72.png" width=50%>  
音源データさえあれば、楽曲をすぐに販売することができます。  

・<b>作曲依頼プランの販売</b>  
<img src="https://user-images.githubusercontent.com/86698464/129843631-2c9989ae-d365-4592-b729-d32d2c22c002.png" width=50%>  
・<b>ユーザーを検索</b>  
<img src="https://user-images.githubusercontent.com/86698464/129843975-57873346-e718-4fb5-9ba3-1362af97fd21.png" width=50%>  
ユーザーをユーザー名やプロフィールで検索することができます。 

・<b>ユーザーとのコミュニケーション</b>  
<img src="https://user-images.githubusercontent.com/86698464/129844309-549e292d-b723-449b-afa2-4bed8dadefcc.png" width=50%>  


# 本アプリの目的
現在、動画制作、配信業、イベント企画など、様々な場面において音楽は必要不可欠なものとなっており、その需要は大きいものとなっています。

### <b>オリジナリティの高い、高品質な音楽を</b>
インターネット上にフリー音源は沢山存在しますが、そうした音源だとオリジナリティに欠けてしまうという問題があります。  
本アプリでは有料の音源を集め、よりオリジナリティの高い、高品質な音楽を探すことができます。

### <b>作曲依頼の敷居の高さを解消</b>
作曲の依頼を出す際、依頼料の相場や依頼した音源の作成期間の目安がわからず、依頼を出すこと自体が難しくなってしまうという課題がありました。  
本アプリでは、あらかじめクリエイター側が作曲プランとして料金や納期を提示しておくことで、そうした課題を解消しています。

### <b>オリジナル曲を求めるユーザーを見つけやすく</b>
動画をはじめとした、個人レベルのプロダクト制作の普及や、配信者のプロモーションなど、オリジナル曲の需要は高まっています。しかし、そのようにオリジナル楽曲を求めている人をSNSなどで検索して探していくのは骨の折れる作業です。  
本アプリでは動画製作者やイベント企画者などユーザーを検索し、コミュニケーションを取れるようになっており、より容易に顧客を見つけ出すことができます。

# テーブル設計

## user テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |

### Association
-has_many :dls  
-has_many :songs, through: :dls  
-has_many :chats, dependent: :destroy  
-has_many :messages, dependent: :destroy


## creators テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| c_name             | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |

### Association
-has_many :songs  
-has_many :plans, dependent: :destroy  
-has_many :chats, dependent: :destroy  
-has_many :messages, dependent: :destroy  

## songs テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| audio       | string     | null: false                    |
| genre_id    | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false,                   |
| image       | string     |                                |
| song        | references | null: false, foreign_key: true |

### Association
-belongs_to :creator  
-has many :users, through :dls

### dls テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| song   | references | null: false, foreign_key: true |

### Association
-belongs_to :user  
-belongs_to :song

### plans テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| course      | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |
| delivery    | string     | null: false                    |
| creator     | references | null: false, foreign_key: true |

### Association
-belongs_to :creator

### orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| plan   | references | null: false, foreign_key: true |

### Association

-belongs_to :user  
-belongs_to :plan  
-has_one :request


### requests テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| purpose | string     | null: false                    |
| demand  | string     | null: false                    |
| order   | references | null: false, foreign_key: true |

### Association
-belongs_to :order

### chats テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| creator| references | null: false, foreign_key: true |

### Association
-belongs_to :user  
-belongs_to :creator  
-has_many :messages, dependent: :destroy

### messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| creator | references | null: false, foreign_key: true |
| chat    | references | null: false, foreign_key: true |

### Association
-belongs_to :creator, optional: true  
-belongs_to :user, optional: true  
-belongs_to :chat  

# ローカルでの構築方法
・rails v 6.0.0

$ git clone https://github.com/koluhei/otolie.git  
$ cd otolie  
$ bundle install  
$ rails db:create  
$ rails db:migrate  
$ rails s  
http://localhost:3000 へアクセス  