# frozen_string_literal: true

module HexletCode
  # HtmlPresenter
  class HtmlPresenter
    @tags_map = {
      br: { brackets: "single" },
      img: { brackets: "single" },
      input: { brackets: "single" },
      label: { brackets: "double" },
      div: { brackets: "double" },
      textarea: { brackets: "double" },
      form: { brackets: "double" }
    }
    class << self
      attr_reader :tags_map

      def serialaze_attrs(attrs)
        if attrs.empty?
          ""
        else
          attrs.map do |k, v|
            "#{k}=\"#{v}\""
          end.join(" ").prepend(" ")
        end
      end

      def serialize(tag, attrs, body = "")
        brackets = @tags_map[tag][:brackets]
        raise "Unknown tag - #{tag}" unless tag

        case brackets
        when "single"
          "<#{tag}#{serialaze_attrs(attrs)}>"
        when "double"
          "<#{tag}#{serialaze_attrs(attrs)}>#{body}</#{tag}>"
        end
      end
    end
  end
end
