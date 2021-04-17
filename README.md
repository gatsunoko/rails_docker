ディレクトリ名を使用したいプロジェクト名に変更

ディレクトリ内のすべてのファイルの「GatsuRails」という文字を使用したいプロジェクト名に置換
```
$docker-compose build
$docker-compose run --rm app rails new ./ -d mysql
```
config/enviroments/development.rbの
```
config.file_watcher = ActiveSupport::EventedFileUpdateChecker
```
を
```
config.file_watcher = ActiveSupport::FileUpdateChecker
```
に変更
config/database.ymlを
```
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV.fetch("MYSQL_USERNAME", "root") %>
  password: <%= ENV.fetch("MYSQL_PASSWORD", "password") %>
  host: <%= ENV.fetch("MYSQL_HOST", "db") %>

development:
  <<: *default
  database: projectname_development

test:
  <<: *default
  database: projectname_test

production:
  <<: *default
  database: projectname_production
```
に変更(projectnameは自分のプロジェクト名に)
```
$docker-compose run --rm app rails db:create
$docker-compose run --rm app rails db:migrate
```
した後
```
$docker-compose up
```
でサーバー起動
