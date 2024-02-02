# frozen_string_literal: true

module HexletCode
  # Tag
  class Tag
    SINGLE_TAGS = %w[input img br].freeze
    class << self
      def input_transform(as)
        as == :text ? :textarea : :input
      end

      def single_type?(tag)
        @tags_map[tag][:type] == 'single'
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

        { name:, type:, value:, **attrs.except(:name, :type, :value) }.compact
      end

      def build(tag, attrs, presenter)
        attrs = build_attrs(tag, attrs)

        if SINGLE_TAGS.include? tag
          presenter.serialize(tag, attrs)
        else
          body = block_given? ? yield : ''
          presenter.serialize(tag, attrs, body)
        end
      end

      def build_attrs(tag, attrs)
        @tags_map[tag][:default_attrs].merge(attrs)
      end
    end
  end
end
