# frozen_string_literal: true

module HexletCode
  # FormRender
  class FormRender
    def self.render_html(builded_form)
      builded_form.form_body => {inputs:, submit:, form_options:}

      rendered_submit = render_submit(submit)

      HexletCode::Tag.build('form', form_options) do
        form_body = "#{inputs.join}#{rendered_submit}"
        form_body.prepend("\n") unless form_body.empty?
      end
    end

    def self.render_submit(submit)
      return '' if submit.nil?

      submit[:options] => {tag:, **attributes}
      "  #{HexletCode::Tag.build(tag, attributes)}\n"
    end
  end
end
