# frozen_string_literal: true

require 'test_helper'
class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def setup
    # @fixtures = read_fixtures
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_it_generates_form
    expected = read_fixture('form')
    actual = HexletCode.form_for(@user)
    assert_equal expected, actual
  end

  def test_it_generates_form_with_url
    expected = read_fixture('form_with_url')
    actual = HexletCode.form_for(@user, url: '/users')
    assert_equal expected, actual
  end

  def test_it_generates_form_with_additional_attributes
    expected = read_fixture('form_with_additional_attributes')
    actual = HexletCode.form_for @user, url: '/profile', method: :get, class: 'hexlet-form', &:submit
    assert_equal expected, actual
  end

  def test_it_generates_form_with_input
    expected = read_fixture('form_with_input')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_input_as
    expected = read_fixture('form_with_input_as')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_input_additional_attrs
    expected = read_fixture('form_with_input_additional_attrs')
    actual = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal expected, actual
  end

  def test_it_raise_on_struct_miising_method
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # missing field
      end
    end
  end

  def test_it_generates_form_with_submit
    expected = read_fixture('form_with_submit')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal expected, actual
  end

  def test_it_generates_form_with_submit_value
    expected = read_fixture('form_with_submit_value')
    actual = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal expected, actual
  end
end
