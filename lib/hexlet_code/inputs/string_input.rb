# frozen_string_literal: true

module HexletCode
  module Inputs
    # StringInput
    class StringInput < HexletCode::Inputs::BaseInput
      TAG_NAME = 'input'

      def render
        tag = HexletCode::Tag.build(TAG_NAME, @attrs)

        "  #{label}\n  #{tag}\n"
      end

      def self.default_attrs
        { type: 'text' }
      end
    end
  end
end
