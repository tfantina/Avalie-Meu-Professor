BONSAI_URL = ENV['privet-7322854.us-east-1.bonsai.io']

if BONSAI_URL
Searchkick.client = Elasticsearch::Client.new({
  url:BONSAI_URL,
  log: true
  })
end
