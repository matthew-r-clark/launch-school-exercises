# Write a minitest assertion that will fail if the value.odd? is not true.
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class BooleanAssertion < Minitest::Test
  def test_odd?
    value1 = 7
    value2 = 6
    assert value1.odd?, "`#{value1}.odd?` is not truthy"
    assert value2.odd?, "`#{value2}.odd?` is not truthy"
  end
end