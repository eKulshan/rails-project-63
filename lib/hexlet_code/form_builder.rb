# frozen_string_literal: true

require 'active_support/core_ext/string/inflections'

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
    attr_accessor :entity, :form_body

    def input(name, **attributes)
      value = @entity.public_send(name)
      input_type = FormBuilder.select_input_class(attributes.fetch(:as, :string))
      input = input_type.new({ name:, value: }.merge(attributes.except(:as)))
      @form_body[:inputs] << input
    end

    def submit(value = 'Save')
      submit_attributes = { tag: 'input', type: 'submit', value: }
      @form_body[:submit] = { options: submit_attributes }
    end

    def self.select_input_class(tag)
      klass_name = "HexletCode::Inputs::#{tag.capitalize}Input"
      klass_name.constantize
    end
  end
end
