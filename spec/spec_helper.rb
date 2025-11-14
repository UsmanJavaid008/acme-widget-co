# frozen_string_literal: true

require 'bundler/setup'
require 'rspec'

$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
