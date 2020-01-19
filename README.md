[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/massongit/write_me)

# Write Me!
OSSへコミットしてみたい人とREADMEを記述して欲しいOSSの開発者を繋ぐサービス

## Ruby version
2.6.5

## 必要なソフトウェア・ライブラリ
* rbenv
* postgresql
* Docker
* docker-compose

## 対応ブラウザ
[browserl.ist: A page to display compatible browsers from a browserslist string.](https://browserl.ist/?q=%3E+0.5%25%2C+%3E+0.5%25+in+JP%2C+last+2+versions%2C+Firefox+ESR%2C+not+dead)参照

## 開発環境構築方法
1. rbenvでRubyをインストールします。
    ```sh
    $ rbenv install 2.6.5
    ```

1. シェルでのRubyをインストールしたRubyに切り替えます。
    ```sh
    $ rbenv shell 2.6.5
    ```

1. 必要なライブラリをインストールします。
    ```sh
    $ bundle install
    ```

1. 以下のように `.env` ファイルを作成します。
    ```.env
    POSTGRES_USER={DBのユーザーID (任意)}
    POSTGRES_PASSWORD={DBのパスワード (任意)}
    ```

1. Dockerコンテナ (DB) を立ち上げます。
    ```sh
    $ docker-compose up -d
    ```

1. DBのマイグレーションを行います。
    ```sh
    $ bundle exec rake db:create db:migrate
    ```

1. サーバーを起動します ( http://localhost:3000/ へアクセスするとサイトが表示されます)。
    ```sh
    $ bundle exec rails s
    ```
