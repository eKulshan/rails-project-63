# frozen_string_literal: true

require_relative "hexlet_code/version"
# require_relative "./form"
# require_relative "./tag"
# HexletCode
module HexletCode
  class Error < StandardError; end
  autoload :Tag, "hexlet_code/tag"
  autoload :Form, "hexlet_code/form"

  def self.form_for(struct, attrs = {})
    form = Form.new struct, attrs
    yield(form) if block_given?
    form.to_s
  end
end
