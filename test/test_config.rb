require 'test/unit'

PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

class Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    RubyCommitters
  end

  protected

  def assert_difference(expressions, difference = 1, message = nil, &block)
    expression_evaluations = Array(expressions).collect{ |expression| lambda { eval(expression, block.send(:binding)) } }

    original_values = expression_evaluations.inject([]) { |memo, expression| memo << expression.call }
    yield
    expression_evaluations.each_with_index do |expression, i|
      assert_equal original_values[i] + difference, expression.call, message
    end
  end
end
