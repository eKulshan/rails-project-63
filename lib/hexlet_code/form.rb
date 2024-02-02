# frozen_string_literal: true

module HexletCode
  # Form
  class Form
    DEFAULT_ACTION = '#'
    DEFAULT_METHOD = 'post'

    def initialize(entity, attrs)
      @entity = entity
      @attrs = attrs.except(:url).merge(action: attrs.fetch(:url, DEFAULT_ACTION),
                                        method: attrs.fetch(:method,
                                                            DEFAULT_METHOD))
      @inputs = []
      @submit = nil
      @presenter = attrs[:presenter] || HtmlPresenter
    end

    def input_tag_name(as)
      as == :text ? :textarea : :input
    end

    def input(name, as: nil, **attrs)
      attrs[:value] = @entity.public_send(name)
      attrs[:name] = name

      @inputs << { as:, attrs: }
    end

    def submit(value = 'Save')
      @submit = value
    end

    def build_inputs_string
      @inputs.map do |input|
        input_label = Tag.build(:label, { for: input.dig(:attrs, :name) }, @presenter) do
          input.dig(:attrs, :name).capitalize
        end.prepend('  ')
        input = Tag.build_input(input, @presenter).prepend('  ')
        "#{input_label}\n#{input}"
      end
    end

    def build_submit_string
      return nil if @submit.nil?

      Tag.build(:input, { type: 'submit', value: @submit }, @presenter).prepend('  ')
    end

    def to_s
      inputs = [*build_inputs_string, build_submit_string].compact
      form_body = inputs.empty? ? '' : "\n#{inputs.join("\n")}\n"
      Tag.build(:form, @attrs, @presenter) { form_body }
    end
  end
end
