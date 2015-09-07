require_relative 'node'
class Tree

  attr_accessor :base
  def initialize(data)
    @base = Node.new(data)
    @array = [@base.data]
  end

  def insert_right(data)
    current = @base
    @array << data
    until current.right_node.nil?
      current = current.right_node
    end
    if data < current.data
      current.left_node = Node.new(data)
    else
      current.right_node = Node.new(data)
    end
  end

  def insert_left(data)
    current = @base
    @array << data
    until current.left_node.nil?
      current = current.left_node
    end
    if data > current.data
      current.right_node = Node.new(data)
    else
      current.left_node = Node.new(data)
    end

    def depth_of(data)
      current = @base
      counter = 0
      until data == current.data
        counter += 1
      end

    end
  end

  def insert(data)
    if data < @base.data
      insert_left(data)
    else
      insert_right(data)
    end
  end

  def include?(data)
    @array.include?(data)
  end

  def minimum
    current = @base
    until current.left_node.nil?
      current = current.left_node
    end
    current.data
  end

  def maximum
    current = @base
    until current.right_node.nil?
      current = current.right_node
    end
    current.data
  end
end
