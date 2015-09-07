require_relative 'node'
class Tree

  attr_accessor :base, :array
  def initialize(data)
    @base = Node.new(data)
    @array = [@base.data]
  end

  def insert_right(node, data)
    current = node
    if current.right_node.nil?
      return current.right_node = Node.new(data)
    end
    current = current.right_node
    if data < current.data
      insert_left(current, data)
    else
      insert_right(current, data)
    end
  end

  def insert_left(node, data)
    current = node
    if current.left_node.nil?
      return current.left_node = Node.new(data)
    end
    current = current.left_node
    if data > current.data
      insert_right(current, data)
    else
      insert_left(current, data)
    end
  end

  def depth_of(data)
    current = @base
    counter = 1
    until data == current.data
      if data < current.data
        current = current.left_node
      else
        current = current.right_node
      end
      counter += 1
    end
    counter
  end

  def insert(data)
    current = @base
    @array << data
    if data < current.data
      insert_left(current, data)
    else
      insert_right(current, data)
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

  def count
    @array.count
  end

  def sort
    iterate = @array.count - 1
    loop do
      swapped = 0
      iterate.times do |index|
        if array[index] > array[index + 1]
          array[index], array[index + 1] = array[index + 1], array[index]
          swapped = 1
        end
      end
      if swapped == 0
        break
      end
    end
    array
  end

  def max_height
    
  end

  def delete_right(data)
  end
end
