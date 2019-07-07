require 'minitest/autorun'
require_relative 'text.rb'
system 'clear'

class TextTest < Minitest::Test
  def setup
    @file = File.open('text.txt')
    text = ""
    @file.each_line {|line| text += line}
    @text = Text.new(text)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

  def test_swap
    expected_output = "Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\n" + 
    "Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\n" +
    "quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\n" +
    "nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\n" +
    "dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\n" +
    "et verius meuris, et pheretre mi."

    assert_equal(expected_output, @text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end
end