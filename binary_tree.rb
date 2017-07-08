class Node
  attr_accessor :value, :lchild, :rchild, :level
  
  def initialize (value)
    @value = value
    @lchild = nil
    @rchild = nil
    @level = 0
  end

end

#Inspiration for building all nodes, then sorting comes from from thisisned's TOP solution

class BinaryTree
  attr_accessor :root
  
  def initialize(array)
    @tree = []
    @root = nil
    build_tree(array)
  end
  
  def display(node = @root)
    display = @tree
    display.each do |node| 
      puts "node value: #{node.value}"
      puts "node level: #{node.level}"
      puts "node lchild: #{node.lchild.value}" if node.lchild != nil
      puts "node rchild: #{node.rchild.value}" if node.rchild != nil
    end
  end
  
  def build_tree(array)
    @root = Node.new(array.shift) if @root == nil
    @tree << @root
    array.each do |value|
      new_node = Node.new(value)
      @tree << new_node
      place_node(new_node)
    end
  end
  
  def place_node(new_node, old_node = @root, level = 1)
    if new_node.value < old_node.value
      if old_node.lchild == nil
        old_node.lchild = new_node
        new_node.level = level
      else
        place_node(new_node, old_node.lchild, level + 1)
      end
    else
      if old_node.rchild == nil
        old_node.rchild = new_node
        new_node.level = level
      else
        place_node(new_node, old_node.rchild, level + 1)
      end
    end
  end

  def breadth_first_search(parameter)
    unchecked = []
    unchecked << @root
    while unchecked.empty? == false
      node = unchecked.shift
      if node.value == parameter
        return [node, node.value]
      else
        puts "Checked #{node.value}"
        unchecked.push(node.lchild) if node.lchild != nil
        unchecked.push(node.rchild) if node.rchild != nil
      end
    end
    return nil
  end

  def depth_first_search(parameter)
    unchecked = []
    unchecked << @root
    while unchecked.empty? == false
      node = unchecked.shift
      if node.value == parameter
        return [node, node.value]
      else
        puts "Checked #{node.value}"
        unchecked.unshift(node.rchild) if node.rchild != nil
        unchecked.unshift(node.lchild) if node.lchild != nil
      end
    end
    return nil
  end

  def dfs_rec(value, current_node = @root)
    return [current_node, current_node.value] if current_node.value == value
    puts "Checked #{current_node.value}"
    
    left = dfs_rec(value, current_node.lchild) unless current_node.lchild.nil?
    return left if left != nil

    right = dfs_rec(value, current_node.rchild) unless current_node.rchild.nil?
    return right if right != nil

    return nil
  end

end

stuff = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = BinaryTree.new(stuff)
puts tree.dfs_rec(324)