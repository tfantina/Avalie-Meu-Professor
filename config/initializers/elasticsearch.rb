require 'elasticsearch/model'

BONSAI_URL = ENV['BONSAI_URL'] ||
  Rails.application.config_for(:elasticsearch)["http://ivy-3059605.us-east-1.bonsai.io"]

# Set up an app-wide client object
Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: BONSAI_URL,
  log: true
)
