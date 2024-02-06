# frozen_string_literal: true

module HexletCode
  # Inputs
  module Inputs
    autoload(:BaseInput, File.expand_path('inputs/base_input', __dir__))
    autoload(:StringInput, File.expand_path('inputs/string_input', __dir__))
    autoload(:TextInput, File.expand_path('inputs/text_input', __dir__))
  end
end
