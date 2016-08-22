if Rails.env.production?
  cliet = Elasticsearch::Client.new host: ENV['https://8fsolna9:37thfu92eckey5r4@ivy-3059605.us-east-1.bonsai.io']
    else
  url = 'http://localhost:9200/'
    Elasticsearch::Model.client = Elasticsearch::Client.new url: url
  Searchkick.client = Elasticsearch::Client.new(hosts: url, retry_on_failure: true, transport_options: {request: {timeout: 250}})
end
