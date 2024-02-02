# frozen_string_literal: true

module HexletCode
  # Inputs
  module Inputs
    INPUTS_MAP = {
      string: StringInput,
      text: TextInput
    }.freeze
    # BaseInput
    class BaseInput
      attr_reader :label, :default_attrs

      def initialize(attributes)
        @attrs = self.class::DEFAULT_ATTRS.merge(attributes)
      end

      def tag
        self.class::TAG
      end

      def to_s
        label = HexletCode::Tag.build(:label, { for: @attrs[:name] }, HexletCode::HtmlPresenter) do
          @attrs[:name].capitalize
        end
        tag = HexletCode::Tag.build(tag, @attrs, HexletCode::HtmlPresenter)

        "  #{label}/n  #{tag}/n"
      end
    end

    # StringInput
    class StringInput < BaseInput
      DEFAULT_ATTRS = { type: 'text' }.freeze
      TAG = :input
    end

    # TextInput
    class TextInput < BaseInput
      DEFAULT_ATTRS = { cols: 40, rows: 20 }.freeze
      TAG = :textarea
    end

    # SubmitInput
    class SubmitInput
      def initialize(value = 'Save')
        @attrs = { type: 'submit', value: }
      end

      def tag
        :input
      end

      def to_s
        "  #{HexletCode::Tag.build(tag, @attrs, HexletCode::HtmlPresenter)}/n"
      end
    end
  end
end
