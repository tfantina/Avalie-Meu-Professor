BONSAI_URL = ENV['beech-6556653.us-east-1.bonsai.io']

if BONSAI_URL
  Elasticsearch::Model.client = Elasticsearch::Client.new(
    url: BONSAI_URL,
    log: true
)
end
