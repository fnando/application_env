# application_env

[![Tests](https://github.com/fnando/application_env/workflows/ruby-tests/badge.svg)](https://github.com/fnando/application_env)
[![Gem](https://img.shields.io/gem/v/application_env.svg)](https://rubygems.org/gems/application_env)
[![Gem](https://img.shields.io/gem/dt/application_env.svg)](https://rubygems.org/gems/application_env)
[![MIT License](https://img.shields.io/:License-MIT-blue.svg)](https://tldrlegal.com/license/mit-license)

Detect application environments.

## Installation

```bash
gem install application_env
```

Or add the following line to your project's Gemfile:

```ruby
gem "application_env"
```

## Usage

The environment is inferred out of `ENV["APP_ENV"]`, `ENV["RACK_ENV"]`,
`ENV["RAILS_ENV"]`, defaulting to `development` in case no environment is set.

```ruby
require "application_env"

app_env = AppEnv.new

app_env.development?
app_env.test?
app_env.production?

# runs block on production.
app_env.on(:production, &block)

# runs block on any environment.
app_env.on(:any, &block)

# pass in custom env vars
app_env = AppEnv.new({"APP_ENV" => "development"})

# sets up custom accessors
app_env = AppEnv.new(ENV, accessors: %i[development test staging production])
app_env.staging?
```

## Maintainer

- [Nando Vieira](https://github.com/fnando)

## Contributors

- https://github.com/fnando/application_env/contributors

## Contributing

For more details about how to contribute, please read
https://github.com/fnando/application_env/blob/main/CONTRIBUTING.md.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT). A copy of the license can be
found at https://github.com/fnando/application_env/blob/main/LICENSE.md.

## Code of Conduct

Everyone interacting in the application_env project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/fnando/application_env/blob/main/CODE_OF_CONDUCT.md).
