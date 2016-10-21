BONSAI_URL = ENV['https://gi674qws:k48lj07vwc5dqwk7@privet-7322854.us-east-1.bonsai.io']

if BONSAI_URL
Searchkick.client = Elasticsearch::Client.new({
  url:BONSAI_URL,
  log: true
  })
end
