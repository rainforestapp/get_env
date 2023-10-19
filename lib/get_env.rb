# frozen_string_literal: true

require 'get_env/version'

module GetEnv
  class << self
    def [](key)
      return nil if key.nil?

      v = ENV[key].to_i
      return v if v.to_s == ENV[key]

      v = ENV[key].to_f
      return v if v.to_s == ENV[key]

      return false if ENV[key] == 'false'
      return true if ENV[key] == 'true'

      ENV[key]
    end

    def fetch(*args, &block)
      case args
      in [key, default] then fetch_with_default(key, default)
      in [key] then fetch_without_default(key, &block)
      else raise ArgumentError
      end
    end

    private

    def fetch_with_default(key, default)
      if ENV.has_key?(key)
        self[key]
      else
        default
      end
    end

    def fetch_without_default(key, &block)
      if ENV.has_key?(key)
        self[key]
      elsif block_given?
        block.call
      else
        ENV.fetch(key) # Will raise a KeyError
      end
    end
  end
end
