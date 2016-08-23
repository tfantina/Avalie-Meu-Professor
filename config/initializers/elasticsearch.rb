
  url = 'https://ivy-3059605.us-east-1.bonsai.io'
    Elasticsearch::Model.client = Elasticsearch::Client.new url: url
  Searchkick.client = Elasticsearch::Client.new(hosts: url, retry_on_failure: true, transport_options: {request: {timeout: 250}})
