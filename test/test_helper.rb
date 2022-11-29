# frozen_string_literal: true

require "simplecov"
SimpleCov.start

require "bundler/setup"
require "application_env"

require "minitest/utils"
require "minitest/autorun"

Dir["#{__dir__}/support/**/*.rb"].sort.each do |file|
  require file
end
