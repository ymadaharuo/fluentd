FluentdでElasticsearchにログを登録する

環境作成
・vmにCentOS7を入れる
・vmにTera Termでログインし、projects/fluentd ディレクトリ作成。直下にソースを設置
・以下を実行
  docker-compose down
  docker-compose up
apache、Elasticsearch、Fluentd、Kibana が起動する

参考URL
https://docs.fluentd.org/container-deployment/docker-compose


・elasticsearchにログを登録する
/root/projects/fluentd/fluentd/conf/aaa ファイルを作成し、
::1 - - [11/May/2020:14:35:04 +0900] "OPTIONS * HTTP/1.0" 200 - 121 /xxx/xxx/xxxx/* "-" "Apache/2.4.6 (CentOS) (internal dummy connection)" "-"
を書いて保存
cat aaa > tail.log
を実行すると、elasticsearchに保存される

elasticsearchは起動が遅いので、
curl -XGET localhost:9200/_cat/indices?v
で確認

yellow open   fluentd-20200514     7_CNEaYZQWeJ0URWfZZOeg   1   1          8            0     31.5kb         31.5kb
のようなものが登録されていればOK

中身を確認するには
curl -XGET localhost:9200/fluentd-20200514/_search?pretty