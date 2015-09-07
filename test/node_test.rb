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
    node.right_node = Node.new(5)
    assert_equal 5, node.right_node.data
  end

  def test_it_can_find_node
    node = Node.new(5)
    node.right_node = Node.new(8)
    node.right_node.left_node = Node.new(6)
    node.left_node = Node.new(2)
    node.left_node.left_node = Node.new(1)
    assert_equal node, node.find(5)
    assert_equal node.right_node, node.find(8)
    assert_equal node.left_node, node.find(2)
    assert_equal node.left_node.left_node, node.find(1)
    assert_equal node.right_node.left_node, node.find(6)
    refute node.find(40)
  end

end
