Fluentd��Elasticsearch�Ƀ��O��o�^����

���쐬
�Evm��CentOS7������
�Evm��Tera Term�Ń��O�C�����Aprojects/fluentd �f�B���N�g���쐬�B�����Ƀ\�[�X��ݒu
�E�ȉ������s
  docker-compose down
  docker-compose up
apache�AElasticsearch�AFluentd�AKibana ���N������

�Q�lURL
https://docs.fluentd.org/container-deployment/docker-compose


�Eelasticsearch�Ƀ��O��o�^����
/root/projects/fluentd/fluentd/conf/aaa �t�@�C�����쐬���A
::1 - - [11/May/2020:14:35:04 +0900] "OPTIONS * HTTP/1.0" 200 - 121 /xxx/xxx/xxxx/* "-" "Apache/2.4.6 (CentOS) (internal dummy connection)" "-"
�������ĕۑ�
cat aaa > tail.log
�����s����ƁAelasticsearch�ɕۑ������

elasticsearch�͋N�����x���̂ŁA
curl -XGET localhost:9200/_cat/indices?v
�Ŋm�F

yellow open   fluentd-20200514     7_CNEaYZQWeJ0URWfZZOeg   1   1          8            0     31.5kb         31.5kb
�̂悤�Ȃ��̂��o�^����Ă����OK

���g���m�F����ɂ�
curl -XGET localhost:9200/fluentd-20200514/_search?pretty