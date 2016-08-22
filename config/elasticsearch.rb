if Rails.env == "production"
  url = 'https://1nhdf4bq:tf1l6ojt0i5v92s@myrtle-4777484.us-east-1.bonsai.io'
    Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV['BONSAI_URL']
  Searchkick.client = Elasticsearch::Client.new(hosts: url, retry_on_failure: true, transport_options: {request: {timeout: 250}})
else
  url = 'http://localhost:9200/'
    Elasticsearch::Model.client = Elasticsearch::Client.new url: url
  Searchkick.client = Elasticsearch::Client.new(hosts: url, retry_on_failure: true, transport_options: {request: {timeout: 250}})
end
