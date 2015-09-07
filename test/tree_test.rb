require './lib/tree'
gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class TreeTest < Minitest::Test

  def test_base_node_can_accept_data
    tree = Tree.new(3)
    assert_equal 3, tree.base.data
  end

  def test_it_can_insert_nodes_to_left_of_base
    tree = Tree.new(7)
    tree.insert(5)
    tree.insert(2)
    tree.insert(6)
    assert_equal 5, tree.base.left_node.data
    assert_equal 2, tree.base.left_node.left_node.data
    assert_equal 6, tree.base.left_node.right_node.data
  end

  def test_it_can_insert_nodes_to_right_of_base
    tree = Tree.new(4)
    tree.insert(8)
    tree.insert(11)
    tree.insert(10)
    assert_equal 8, tree.base.right_node.data
    assert_equal 11, tree.base.right_node.right_node.data
    assert_equal 10, tree.base.right_node.right_node.left_node.data
  end

  def test_it_can_insert_node_in_correct_location
    tree = Tree.new(10)
    tree.insert(5)
    tree.insert(2)
    tree.insert(7)
    tree.insert(12)
    tree.insert(11)
    assert_equal 10, tree.base.data
    assert_equal 5, tree.base.left_node.data
    assert_equal 2, tree.base.left_node.left_node.data
    assert_equal 7, tree.base.left_node.right_node.data
    assert_equal 12, tree.base.right_node.data
    assert_equal 11, tree.base.right_node.left_node.data
  end

  def test_it_includes_data
    tree = Tree.new(5)
    tree.insert(7)
    tree.insert(9)
    tree.insert(12)
    tree.insert(13)
    assert tree.include?(7)
    assert tree.include?(9)
    assert tree.include?(12)
    assert tree.include?(13)
    assert tree.include?(5)
    refute tree.include?(99)
  end

  def test_it_can_return_minimum_data
    tree = Tree.new(5)
    tree.insert(3)
    tree.insert(1)
    tree.insert(-1)
    tree.insert(7)
    tree.insert(9)
    assert_equal -1, tree.minimum
  end

  def test_it_can_return_maximum_data
    tree = Tree.new(50)
    tree.insert(3)
    tree.insert(150)
    tree.insert(-1)
    tree.insert(23)
    tree.insert(21)
    tree.insert(700)
    tree.insert(650)
    assert_equal 700, tree.maximum
  end

  def test_it_can_return_depth_of_node
    tree = Tree.new(50)
    tree.insert(3)
    tree.insert(150)
    tree.insert(-1)
    tree.insert(23)
    tree.insert(21)
    tree.insert(700)
    assert_equal 3, tree.depth_of(23)
    assert_equal 1, tree.depth_of(50)
    assert_equal 2, tree.depth_of(150)
    assert_equal 3, tree.depth_of(700)
    assert_equal 3, tree.depth_of(-1)
    assert_equal 4, tree.depth_of(21)
  end

end
