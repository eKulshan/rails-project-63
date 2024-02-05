# frozen_string_literal: true

module HexletCode
  module Inputs
    # StringInput
    class StringInput < HexletCode::Inputs::BaseInput
      DEFAULT_ATTRS = { type: 'text' }.freeze
      TAG = 'input'
    end
  end
end
