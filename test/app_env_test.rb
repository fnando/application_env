# frozen_string_literal: true

require "test_helper"

class AppEnvTest < Minitest::Test
  test "defaults to development" do
    app_env = AppEnv.new({})

    assert_equal "development", app_env.env
  end

  test "sets env out of APP_ENV" do
    app_env = AppEnv.new({"APP_ENV" => "production"})

    assert_equal "production", app_env.env
  end

  test "sets env out of RACK_ENV" do
    app_env = AppEnv.new({"RACK_ENV" => "production"})

    assert_equal "production", app_env.env
  end

  test "sets env out of RAILS_ENV" do
    app_env = AppEnv.new({"RAILS_ENV" => "production"})

    assert_equal "production", app_env.env
  end

  test "compares to value" do
    app_env = AppEnv.new({"APP_ENV" => "production"})

    assert app_env == "production"
    assert app_env == :production
  end

  test "defines default accessors" do
    assert AppEnv.new({"APP_ENV" => "production"}).production?
    assert AppEnv.new({"APP_ENV" => "development"}).development?
    assert AppEnv.new({"APP_ENV" => "test"}).test?
  end

  test "defines custom accessors" do
    assert AppEnv.new({"APP_ENV" => "staging"}, accessors: %w[staging]).staging?
    assert AppEnv.new({"APP_ENV" => "staging"}, accessors: %i[staging]).staging?
  end

  test "overrides to_s" do
    assert_equal "production", AppEnv.new({"APP_ENV" => "production"}).to_s
  end

  test "runs code on given environment" do
    app_env = AppEnv.new({"APP_ENV" => "production"})
    calls = []

    app_env.on(:production) { calls << :production1 }
    app_env.on(:development) { calls << :development }
    app_env.on(:test) { calls << :test }
    app_env.on(:production) { calls << :production2 }

    assert_equal %i[production1 production2], calls
  end
end
