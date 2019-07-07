require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
system 'clear'

require_relative 'transaction.rb'

class CashRegisterTest < MiniTest::Test
  def setup
    @transaction1 = Transaction.new(50)
    @transaction1.amount_paid = 50
    @transaction2 = Transaction.new(25)
    @transaction2.amount_paid = 28
  end

  def test_prompt_for_payment
    item_cost = 25
    input = StringIO.new("#{item_cost}\n")
    output = StringIO.new
    @transaction2.prompt_for_payment(input: input, output: output)
    assert_equal(item_cost, @transaction2.amount_paid)
  end
end