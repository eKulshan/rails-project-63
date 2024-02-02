# frozen_string_literal: true

module HexletCode
  # FormBuilder
  class FormBuilder
    DEFAULT_ACTION = '#'
    DEFAULT_METHOD = 'post'

    def initialize(entity, attributes)
      @entity = entity
      action = attributes.fetch(:url, DEFAULT_ACTION)
      method = attributes.fetch(:method, DEFAULT_METHOD)
      @form_body = {
        inputs: [],
        submit: nil,
        form_options: { action:, method: }.merge(attributes.except(:url, :method))
      }
    end

    def input(name, **attributes)
      value = @entity.public_send(name)
      input_type = HexletCode::Inputs::INPUTS_MAP[attributes.fetch(:as, :string)]
      input = input_type.new({ name:, value: }.merge(attributes.except(:as)))
      @form_body[:inputs] << input
    end

    def submit(value)
      @form_body[:submit] = HexletCode::Inputs::SubmitInput.new value
    end
  end
end
