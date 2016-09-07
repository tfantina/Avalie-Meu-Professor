require 'elasticsearch/model'

# Load the Bonsai URL into your app. We recommend the "12 Factor App"
# convention of using an environment variable. You may also use the
# Rails 4.2+ config_for method to fetch the URL from an optional
# config/elasticsearch.yml file.

BONSAI_URL = ENV['http://beech-6556653.us-east-1.bonsai.io'] ||
  Rails.application.config_for(:elasticsearch)["http://beech-6556653.us-east-1.bonsai.io"]

# Set up an app-wide client object
Elasticsearch::Model.client = Elasticsearch::Client.new(
  url: BONSAI_URL,
  log: true
)
