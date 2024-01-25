# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

User = Struct.new(:name, :job, :gender, keyword_init: true)

def read_fixtures
  res = {}
  Dir.each_child(File.expand_path('./fixtures', __dir__)) do |f|
    res[File.basename(f, '.html')] = File.read(File.expand_path("./fixtures/#{f}", __dir__))
  end
  res
end
