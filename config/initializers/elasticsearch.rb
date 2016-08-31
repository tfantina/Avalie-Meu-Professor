BONSAI_URL = ENV['http://ivy-3059605.us-east-1.bonsai.io']
if BONSAI_URL
  Elasticsearch::Model.client = Elasticsearch::client = Elasticsearch::Client.new(
      url: http://ivy-3059605.us-east-1.bonsai.io,
      log: true
  )

end  
