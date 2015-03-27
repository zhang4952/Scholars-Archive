web: bundle exec rails s -p $PORT
worker: bundle exec rake QUEUE=* environment resque:work
jetty: sh -c 'cd jetty && java -Djetty.port=8983 -Dsolr.solr.home=/opt/scholars-archive/jetty/solr -Xmx512m -XX:MaxPermSize=128m -jar start.jar'
