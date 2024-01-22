# frozen_string_literal: true

module HexletCode
  # Tag
  class Tag
    class << self
      def build(tag, attrs = {})
        single = %w[br img input]
        doubles = %w[label div form]

        attrs_string = attrs.empty? ? "" : attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(" ").prepend(" ")

        if single.include? tag
          "<#{tag}#{attrs_string}>"
        elsif doubles.include? tag
          "<#{tag}#{attrs_string}>#{block_given? ? yield : ""}</#{tag}>"

        else
          raise "Unknown tag - #{tag}"
        end
      end
    end
  end
end
