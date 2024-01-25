# frozen_string_literal: true

module HexletCode
  # Tag
  class Tag
    @tags_map = {
      br: { default_attrs: {} },
      img: { default_attrs: {} },
      div: { default_attrs: {} },
      label: { type: "double", default_attrs: {} },
      input: { type: "single", default_attrs: { type: "text" } },
      textarea: { type: "double", default_attrs: { cols: 20, rows: 40 } },
      form: { type: "double", default_attrs: { action: "#", method: "post" } }
    }
    class << self
      attr_reader :tags_map

      def input_transform(as)
        as == :text ? :textarea : :input
      end

      def single_type?(tag)
        @tags_map[tag][:type] == "single"
      end

      def build_input(input, presenter)
        tag = input_transform(input[:as])
        attrs = build_input_attrs(tag, input[:attrs])

        if single_type?(tag)
          presenter.serialize(tag, attrs)
        else
          body = attrs.delete(:value)
          presenter.serialize(tag, attrs, body)
        end
      end

      def build_input_attrs(tag, attrs)
        attrs = @tags_map[tag][:default_attrs].merge(attrs)

        name = attrs.fetch(:name, nil)
        type = attrs.fetch(:type, nil)
        value = attrs.fetch(:value, nil)

        { name: name, type: type, value: value, **attrs.except(:name, :type, :value) }.compact
      end

      def build(tag, attrs, presenter)
        attrs = build_attrs(tag, attrs)

        if single_type?(tag)
          presenter.serialize(tag, attrs)
        else
          body = block_given? ? yield : ""
          presenter.serialize(tag, attrs, body)
        end
      end

      def build_attrs(tag, attrs)
        @tags_map[tag][:default_attrs].merge(attrs)
      end
    end
  end
end
