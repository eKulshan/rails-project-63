# frozen_string_literal: true

module HexletCode
  module Inputs
    # BaseInput
    class BaseInput
      def initialize(attributes)
        @attrs = self.class.default_attrs.merge(attributes)
      end

      def label
        HexletCode::Tag.build('label', { for: @attrs[:name] }) do
          @attrs[:name].capitalize
        end
      end

      def self.default_attrs
        {}
      end
    end
  end
end
