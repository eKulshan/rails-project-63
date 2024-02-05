# frozen_string_literal: true

module HexletCode
  # FormRender
  class FormRender
    def self.render_html(builded_form)
      builded_form.form_body => {inputs:, submit:, form_options:}

      HexletCode::Tag.build('form', form_options) do
        form_body = "#{inputs.join}#{submit}"
        form_body.prepend("\n") unless form_body.empty?
      end
    end
  end
end
