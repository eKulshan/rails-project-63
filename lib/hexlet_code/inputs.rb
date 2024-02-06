# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'
module HexletCode
  # Inputs
  module Inputs
    autoload(:BaseInput, File.expand_path('inputs/base_input', __dir__))
    autoload(:StringInput, File.expand_path('inputs/string_input', __dir__))
    autoload(:TextInput, File.expand_path('inputs/text_input', __dir__))

    def self.select_input_class(tag)
      klass_name = "HexletCode::Inputs::#{tag.capitalize}Input"
      klass_name.constantize
    end
  end
end
