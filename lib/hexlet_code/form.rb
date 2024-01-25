# frozen_string_literal: true

module HexletCode
  # Form
  class Form
    def initialize(struct, url: nil, **attrs)
      @struct = struct
      @attrs = attrs
      @attrs[:action] = url unless url.nil?
      @inputs = []
    end

    def input_tag_name(as)
      as == :text ? :textarea : :input
    end

    def input(name, as: nil, **attrs)
      attrs[:value] = @struct.public_send(name)
      attrs[:name] = name

      @inputs << { as: as, attrs: attrs }
    end

    def to_s(presenter)
      inputs_string = @inputs.map { |i| Tag.build_input(i, presenter).prepend("  ") }.join("\n")

      Tag.build(:form, @attrs, presenter) { inputs_string.empty? ? "" : "\n#{inputs_string}\n" }
    end
  end
end
