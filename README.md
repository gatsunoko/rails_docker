ディレクトリ名を使用したいプロジェクト名に変更

ディレクトリ内のすべてのファイルの「GatsuRails」という文字を使用したいプロジェクト名に置換

$docker-compose build
$docker-compose run --rm app rails new ./ -d mysql

config/enviroments/development.rbの
config.file_watcher = ActiveSupport::EventedFileUpdateChecker
を
config.file_watcher = ActiveSupport::FileUpdateChecker
に変更

$docker-compose run --rm app rails db:create
$docker-compose run --rm app rails db:migrate
した後
$docker-compose up
でサーバー起動
