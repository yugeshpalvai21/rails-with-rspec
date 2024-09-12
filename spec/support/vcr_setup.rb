require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"  # Directory where VCR will store recorded requests
  config.hook_into :webmock  # Use WebMock to intercept HTTP requests
  config.configure_rspec_metadata!  # Automatically create VCR cassettes with RSpec metadata
  config.allow_http_connections_when_no_cassette = true  # Allow HTTP connections when no cassette is being used
end
