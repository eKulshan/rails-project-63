# frozen_string_literal: true

require_relative "hexlet_code/version"
# HexletCode
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, File.expand_path("hexlet_code/tag", __dir__))
  autoload(:Form, File.expand_path("hexlet_code/form", __dir__))

  def self.form_for(struct, attrs = {})
    form = Form.new struct, attrs
    yield(form) if block_given?
    form.to_s
  end
end

# User = Struct.new(:name, :job, :gender, keyword_init: true)

# user = User.new name: "rob", job: "hexlet", gender: "m"

# x = HexletCode.form_for user, url: "url" do |f|
#   # Проверяет есть ли значение внутри name
#   f.input :name
#   # Проверяет есть ли значение внутри job
#   f.input :job, as: :textarea
# end

# pp x
