# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

User = Struct.new(:name, :job, :gender, keyword_init: true)

def read_fixture(name)
  File.read("#{__dir__}/fixtures/#{name}.html")
end
