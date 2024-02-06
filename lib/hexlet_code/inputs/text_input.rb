# frozen_string_literal: true

module HexletCode
  module Inputs
    # TextInput
    class TextInput < BaseInput
      TAG_NAME = 'textarea'
      COLS = 20
      ROWS = 40

      def render
        tag = HexletCode::Tag.build(TAG_NAME, @attrs.except(:value)) { @attrs[:value] }

        "  #{label}\n  #{tag}\n"
      end

      def self.default_attrs
        { cols: COLS, rows: ROWS }
      end
    end
  end
end
