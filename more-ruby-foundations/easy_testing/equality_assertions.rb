# Write a minitest assertion that will fail if value.downcase
# does not return 'xyz'.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EqualityAssertion < Minitest::Test
  def setup
    @value = 'XYZ'
  end

  def test_downcase
    assert_equal 'xyz', @value.downcase
  end
end