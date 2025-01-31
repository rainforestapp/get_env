# frozen_string_literal: true

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
      class NoENV < Base
        extend AutoCorrector

        MSG = 'Use `GetEnv` instead of `ENV`.'

        def_node_matcher :is_ENV_index?, '(send (const nil? :ENV) :[] _key)'
        def_node_matcher :is_ENV_fetch?, '(send (const nil? :ENV) :fetch _key ...)'

        def on_const(node)
          parent = node.parent
          return unless is_ENV_index?(parent) || is_ENV_fetch?(parent)

          add_offense(node) do |corrector|
            if Gem::Version.new(RuboCop::Version.version) >= Gem::Version.new('0.82.0')
              corrector.replace(node, 'GetEnv')
            else
              corrector.replace(node.loc.expression, 'GetEnv')
            end
          end
        end
      end
    end
  end
end
