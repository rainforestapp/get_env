# frozen_string_literal: true

require 'rubocop'

module RuboCop
  module Cop
    module Lint
      # @example
      #   # bad
      #   ENV[]
      #
      #   # bad
      #   ENV.fetch(..)
      #
      #   # good
      #   GetEnv[]
      #
      #   # good
      #   GetEnv.fetch(...)
      class NoENV < Cop
        MSG = 'Use `GetEnv` instead of `ENV`.'

        def_node_matcher :is_ENV?, '(const nil? :ENV)'

        def on_const(node)
          return unless is_ENV?(node)

          add_offense(node)
        end
      end
    end
  end
end
