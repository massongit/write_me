# write_please
OSSへコミットしてみたい人とREADMEを記述して欲しいOSSの開発者を繋ぐサービス

## Ruby version
2.7.0

## 開発環境構築方法
```sh
$ bundle install # 必要なライブラリのインストール
$ docker-compose up -d # Dockerコンテナ (DB) 立ち上げ
$ bundle exec rake db:migrate
$ bundle exec rails s # サーバー起動 (http://localhost:3000/へアクセスすると、サイトが表示される)
```
