gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_base_has_value
    node = Node.new(3)
    assert_equal 3, node.data
  end

  def test_left_node_can_hold_value
    node = Node.new(3)
    node.left_node = 2
    assert_equal 2, node.left_node
  end

  def test_right_node_can_hold_value
    node = Node.new(4)
    node.right_node = 5
    assert_equal 5, node.right_node
  end

end
