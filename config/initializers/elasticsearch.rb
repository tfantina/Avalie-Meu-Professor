require 'elasticsearch/model'

if ENV['http://ivy-3059605.us-east-1.bonsai.io']
  Elasticsearch::Model.client = Elasticsearch::Client.new({url: ENV['http://ivy-3059605.us-east-1.bonsai.io'], logs: true})
end
