# frozen_string_literal: true

module HexletCode
  module Inputs
    # BaseInput
    class BaseInput
      def initialize(attributes)
        @attrs = self.class::DEFAULT_ATTRS.merge(attributes)
      end

      def tag_name
        self.class::TAG
      end

      def label
        HexletCode::Tag.build('label', { for: @attrs[:name] }) do
          @attrs[:name].capitalize
        end
      end

      def to_s
        tag = HexletCode::Tag.build(tag_name, @attrs)

        "  #{label}\n  #{tag}\n"
      end
    end
  end
end
