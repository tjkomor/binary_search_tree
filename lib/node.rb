class Node

  attr_accessor :data, :left_node, :right_node

  def initialize(data)
    @data = data
    @left_node  = nil
    @right_node = nil
  end

  def find(number)
    if number == data
      self
    elsif number > data
      right_node.find(number) unless right_node.nil?
    else
      left_node.find(number) unless left_node.nil?
    end
  end

end
