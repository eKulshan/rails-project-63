# frozen_string_literal: true

module HexletCode
  module Inputs
    # TextInput
    class TextInput < HexletCode::Inputs::BaseInput
      DEFAULT_ATTRS = { cols: 20, rows: 40 }.freeze
      TAG = 'textarea'

      def to_s
        tag = HexletCode::Tag.build(tag_name, @attrs.except(:value)) { @attrs[:value] }

        "  #{label}\n  #{tag}\n"
      end
    end
  end
end
