require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
system 'clear'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(0)
    @transaction1 = Transaction.new(50)
    @transaction1.amount_paid = 50
    @transaction2 = Transaction.new(25)
    @transaction2.amount_paid = 28
  end

  def test_accept_money
    @register.accept_money(@transaction1)
    assert_equal(50, @register.total_money)
  end

  def test_change
    assert_equal(3, @register.change(@transaction2))
  end

  def test_give_receipt
    output = <<~OUTPUT
    You've paid $25.
    OUTPUT
    assert_output(output) {@register.give_receipt(@transaction2)}
  end
end