# frozen_string_literal: true

module HexletCode
  # Form
  class Form
    def initialize(struct, url: nil, **attrs)
      @struct = struct
      @attrs = attrs
      @attrs[:action] = url unless url.nil?
      @inputs = []
      @submit = nil
      @presenter = attrs[:presenter] || HtmlPresenter
    end

    def input_tag_name(as)
      as == :text ? :textarea : :input
    end

    def input(name, as: nil, **attrs)
      attrs[:value] = @struct.public_send(name)
      attrs[:name] = name

      @inputs << { as:, attrs: }
    end

    def submit(value = 'Save')
      @submit = value
    end

    def build_inputs_string
      @inputs.map do |i|
        input_label = Tag.build(:label, { for: i.dig(:attrs, :name) }, @presenter) do
          i.dig(:attrs, :name).capitalize
        end.prepend('  ')
        input = Tag.build_input(i, @presenter).prepend('  ')
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
