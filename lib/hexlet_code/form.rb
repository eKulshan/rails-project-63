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
      tag_name = attrs.delete(:as) || :input

      attrs = attrs.merge({ name: name, value: @struct.public_send(name) })
      @inputs << if HexletCode::Tag.single? tag_name
                   HexletCode::Tag.build(tag_name, attrs)
                 else
                   HexletCode::Tag.build(tag_name, attrs) { @struct.public_send(name) }
                 end
    end

    def to_s
      # Tag.build("form", form_attrs) { @inputs.map { |i| Tag.build(i) }.join }
      Tag.build(:form, @attrs)
    end
  end
end
