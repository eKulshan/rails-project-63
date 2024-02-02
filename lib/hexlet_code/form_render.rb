# frozen_string_literal: true

module HexletCode
  # FormRender
  class FormRender
    def self.render_html(builded_form)
      builded_form[:form_body] => {inputs:, submit:, form_options:}

      HexletCode::Tag.build('form', form_options) do
        "\n#{inputs.join}#{submit}"
      end
    end
  end
end
