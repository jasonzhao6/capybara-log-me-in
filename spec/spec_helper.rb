require 'bundler/setup'
require 'capybara_log_me_in'
require 'capybara/rspec'
require 'yaml'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir = 'spec'
  c.stub_with :fakeweb
  c.allow_http_connections_when_no_cassette = true
end
