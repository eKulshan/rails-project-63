# frozen_string_literal: true

module HexletCode
  # Form
  class Form
    def initialize(struct, attrs)
      @struct = struct
      @attrs = attrs
      @inputs = []
    end

    def input(name, attrs = {})
      tag_name = :input
      if attrs.key?(:as)
        attrs.delete(:as)
        tag_name = :textarea
      end
      tag_value = @struct.public_send(name)

      attrs = attrs.merge({ name: name, value: tag_value })
      @inputs << if HexletCode::Tag.single? tag_name
                   HexletCode::Tag.build(tag_name, attrs)
                 else
                   HexletCode::Tag.build(tag_name, attrs) { tag_value }
                 end
    end

    def to_s
      form_attrs = @attrs.except(:url)
      form_attrs[:action] = @attrs[:url] if @attrs.key? :url
      inputs_string = @inputs.empty? ? "" : "\n#{@inputs.map { |i| i.prepend("  ") }.join("\n")}\n"
      Tag.build(:form, form_attrs) { inputs_string }
    end
  end
end
