# frozen_string_literal: true

module HexletCode
  # FormRender
  class FormRender
    def self.render_html(builded_form)
      inputs, submit, form_options = builded_form.form_body.values_at(:inputs, :submit, :form_options)

      rendered_inputs = render_inputs(inputs)
      rendered_submit = render_submit(submit)

      HexletCode::Tag.build('form', form_options) do
        form_body = "#{rendered_inputs}#{rendered_submit}"
        form_body.prepend("\n") unless form_body.empty?
      end
    end

    def self.render_inputs(inputs)
      inputs.map(&:render).join
    end

    def self.render_submit(submit)
      return '' if submit.nil?

      submit[:options] => { tag:, **attributes }
      "  #{HexletCode::Tag.build(tag, attributes)}\n"
    end
  end
end
