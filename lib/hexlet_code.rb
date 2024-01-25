# frozen_string_literal: true

require_relative "hexlet_code/version"
# HexletCode
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, File.expand_path("hexlet_code/tag", __dir__))
  autoload(:Form, File.expand_path("hexlet_code/form", __dir__))
  autoload(:HtmlPresenter, File.expand_path("hexlet_code/html_presenter", __dir__))

  def self.form_for(struct, url: nil, presenter: HtmlPresenter)
    form = Form.new(struct, url: url)
    yield(form) if block_given?
    form.to_s(presenter)
  end
end
