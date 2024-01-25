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
    end

    def input_tag_name(as)
      as == :text ? :textarea : :input
    end

    def input(name, as: nil, **attrs)
      attrs[:value] = @struct.public_send(name)
      attrs[:name] = name

      @inputs << { as: as, attrs: attrs }
    end

    def submit(value = "Save")
      @submit = value
    end

    def to_s(presenter)
      inputs_string = @inputs.map { |i| Tag.build_input(i, presenter).prepend("  ") }.join("\n")
      submit_string = if @submit.nil?
                        ""
                      else
                        Tag.build(:input, { type: "submit", value: @submit },
                                  presenter).prepend("\n  ")
                      end

      form_body = "#{inputs_string}#{submit_string}"
      Tag.build(:form, @attrs, presenter) { form_body.empty? ? "" : "\n#{form_body}\n" }
    end
  end
end
