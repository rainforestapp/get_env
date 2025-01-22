# frozen_string_literal: true

require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../../lib/rubocop/cop/lint/no_env'

RSpec.describe RuboCop::Cop::Lint::NoENV do
  include RuboCop::RSpec::ExpectOffense

  let(:config) { RuboCop::Config.new }

  subject(:cop) { described_class.new(config) }

  describe '#[]' do
    it 'registers an offense when using `ENV`' do
      expect_offense(<<~RUBY)
        FOO = ENV['FOO']
              ^^^ Lint/NoENV: Use `GetEnv` instead of `ENV`.
      RUBY

      expect_correction(<<~RUBY)
        FOO = GetEnv['FOO']
      RUBY
    end

    it 'does not register an offense when using `GetEnv`' do
      expect_no_offenses(<<~RUBY)
        FOO = GetEnv['FOO']
      RUBY
    end
  end

  describe '#fetch' do
    it 'registers an offense when using `ENV`' do
      expect_offense(<<~RUBY)
        do_the_thing(ENV.fetch('FOO'))
                     ^^^ Lint/NoENV: Use `GetEnv` instead of `ENV`.
      RUBY

      expect_correction(<<~RUBY)
        do_the_thing(GetEnv.fetch('FOO'))
      RUBY
    end

    it 'registers an offense when using `ENV` with a default value' do
      expect_offense(<<~RUBY)
        a = x + ENV.fetch('FOO', 42)
                ^^^ Lint/NoENV: Use `GetEnv` instead of `ENV`.
      RUBY

      expect_correction(<<~RUBY)
        a = x + GetEnv.fetch('FOO', 42)
      RUBY
    end

    it 'does not register an offense when using `GetEnv`' do
      expect_no_offenses(<<~RUBY)
        do_the_thing(GetEnv.fetch('FOO'))
      RUBY
    end

    it 'does not register an offense when using `GetEnv` with a default value' do
      expect_no_offenses(<<~RUBY)
        a = x + GetEnv.fetch('FOO', 42)
      RUBY
    end
  end

  it 'does not register an offense when using `ENV` for a method not defined by `GetEnv`' do
    expect_no_offenses(<<~RUBY)
      ENV.map do |var|
        foo << var.lowercase
      end
    RUBY
  end
end
