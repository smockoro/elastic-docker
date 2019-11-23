pwd
curl --cacert certs/ca/ca.crt -u elastic:PleaseChangeMe https://localhost:9200
curl --cacert certs/ca/ca.crt -u elastic:password https://localhost:9200
curl -v --cacert certs/ca/ca.crt -u elastic:password https://localhost:9200
curl -v --cacert certs/ca/ca.crt -u elastic:password https://elasticseach1:9200
ping elasticsearch1
curl -v --cacert certs/ca/ca.crt -u elastic:password https://elasticsearch1:9200
curl -v --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200
curl -v --cacert config/certificates/elasticsearch1/elasticsearch1.crt -u elastic:password https://elasticsearch1:9200
curl -v --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200
curl -v --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_cluster/health
curl -v --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_cluster/health?pretty()
curl -v --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_cluster/health?pretty
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_nodes?v
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_nodes?v&pretty
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_nodes?pretty
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_cluster/health?pretty
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_cluster/health?pretty
curl localhost:9200
curl https://localhost:9200
curl elasticsearch1:9200
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_cluster/health?pretty
curl --cacert config/certificates/ca/ca.crt -u elastic:password https://elasticsearch1:9200/_cluster/health?pretty
curl elasticsearch1:9200
ping elasticsearch1
curl http://elasticsearch1:9200
curl https://elasticsearch1:9200
curl elasticsearch1:9200
curl elasticsearch1:9200?pretty
curl localhost:9200?pretty
curl -u elastic:password elasticsearch1:9200?pretty
curl -u elastic:password elasticsearch1:9200/_cluster/health?pretty
curl -u elastic:password elasticsearch1:9200/_cluster/health?pretty
curl -u elastic:password elasticsearch1:9200/_cluster/health?pretty
curl -u elastic:password elasticsearch1:9200/_cluster/health?pretty
