# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    @user = Struct.new(:name, :job)
  end

  def test_it_generates_form
    assert_equal '<form action="#" method="post"></form>', HexletCode.form_for(@user)
  end

  def test_it_generates_form_with_url
    assert_equal '<form action="/users" method="post"></form>', HexletCode.form_for(@user, url: "/users")
  end
end
