# frozen_string_literal: true

require_relative 'hexlet_code/version'
# HexletCode
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, File.expand_path('hexlet_code/tag', __dir__))
  autoload(:FormBuilder, File.expand_path('hexlet_code/form_builder', __dir__))
  autoload(:FormRender, File.expand_path('hexlet_code/form_render', __dir__))
  autoload(:Inputs, File.expand_path('hexlet_code/inputs', __dir__))

  def self.form_for(entity, **attrs)
    builded_form = FormBuilder.new(entity, attrs)
    yield(builded_form) if block_given?
    FormRender.render_html(builded_form)
  end
end
