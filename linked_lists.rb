class LinkedList
  def initialize
    @list = Array.new
  end

  def append(input)
    node_name = Node.new(input)
    @list[-1].next_node = node_name.value if @list.size > 0
    @list.push(node_name)
  end
  
  def prepend(input)
    next_node = @list[0].value
    node_name = Node.new(input, next_node)
    @list.unshift(node_name)
  end
  
  def size
    return @list.size
  end
  
  def head
    return @list[0]
  end
  
  def tail
    return @list[-1]
  end
  
  def at(index)
    return @list[index]
  end
  
  def pop
    @list[-2].next_node = nil
    @list.pop
  end
  
  def contains?(data)
    empty = true
    @list.each do |i|
      empty = false if i.value == data
    end
    
    return true if empty == false
    return false if empty == true
  end
  
  def find(data)
    hits = []
    @list.each do |i|
      hits << @list.index(i) if i.value == data
    end
    
    if hits == []
      return nil
    else
      return hits
    end
  end
  
  def to_s
    temp = []
    @list.each do |i|
      temp.push("( #{i.value} ) -> ")
    end
    temp << "nil"
    string = temp.join
    return string
  end
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end