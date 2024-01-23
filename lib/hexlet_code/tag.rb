# frozen_string_literal: true

module HexletCode
  # Tag
  class Tag
    class << self
      @@tags = {
        br: { type: "single", default_attrs: {} },
        img: { type: "single", default_attrs: {} },
        input: { type: "single", default_attrs: { type: "text" } },
        label: { type: "double", default_attrs: {} },
        div: { type: "double", default_attrs: {} },
        textarea: { type: "double", default_attrs: { rows: 50, cols: 50 } },
        form: { type: "double", default_attrs: { action: "#", method: "post" } }
      }

      def single?(name)
        @@tags.dig(name.to_sym, :type) == "single"
      end

      def double?(name)
        @@tags.dig(name.to_sym, :type) == "double"
      end

      def build(name, attrs = {})
        attrs_string = attrs.empty? ? "" : attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(" ").prepend(" ")
        tag = @@tags[name]
        raise "Unknown tag - #{name}" unless tag

        case tag[:type]
        when "single"
          "<#{name}#{attrs_string}>"
        when "double"
          "<#{name}#{attrs_string}>#{block_given? ? yield : ""}</#{name}>"
        else
          raise "Unknown tag type - #{tag.type}"
        end
      end
    end
  end
end
