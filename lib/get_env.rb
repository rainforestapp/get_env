# frozen_string_literal: true

require 'get_env/version'
require 'get_env/cops'

module GetEnv
  def self.[](key)
    return nil if key.nil?

    v = ENV[key].to_i
    return v if v.to_s == ENV[key]

    v = ENV[key].to_f
    return v if v.to_s == ENV[key]

    return false if ENV[key] == 'false'
    return true if ENV[key] == 'true'

    ENV[key]
  end

  def self.fetch(key, default = nil)
    if ENV.has_key?(key)
      self[key]
    elsif !default.nil?
      default
    elsif block_given?
      yield
    else
      ENV.fetch(key) # Will raise a KeyError
    end
  end
end
