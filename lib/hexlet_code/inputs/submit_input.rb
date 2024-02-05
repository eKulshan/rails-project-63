# frozen_string_literal: true

module HexletCode
  module Inputs
    # SubmitInput
    class SubmitInput
      def initialize(value = 'Save')
        @attrs = { type: 'submit', value: }
      end

      def tag
        'input'
      end

      def to_s
        "  #{HexletCode::Tag.build(tag, @attrs)}\n"
      end
    end
  end
end
