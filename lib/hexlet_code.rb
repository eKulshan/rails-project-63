# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  autoload(:Tag, "tag.rb")
  def self.form_for(_struct, form_attrs = { url: "#" })
    HexletCode::Tag.build("form", { action: form_attrs[:url], method: "post" })
  end
end
