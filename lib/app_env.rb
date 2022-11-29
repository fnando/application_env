# frozen_string_literal: true

class AppEnv
  require "app_env/version"

  attr_reader :env

  def initialize(env_vars = ENV, accessors: %i[development test production])
    @env = env_vars["APP_ENV"] ||
           env_vars["RACK_ENV"] ||
           env_vars["RAILS_ENV"] ||
           "development"

    accessors.each do |accessor|
      define_singleton_method("#{accessor}?") do
        self == accessor
      end
    end
  end

  def ==(other)
    env == other.to_s
  end

  def to_s
    env
  end

  def on(expected_env)
    yield if self == expected_env || expected_env == :any # rubocop:disable Style/MultipleComparison
  end
end
